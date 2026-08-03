// Desktop notification when a tool call blocks on an interactive approval prompt.
//
// Fills the gap tracked by https://github.com/can1357/oh-my-pi/issues/3746:
// omp ships `ask.notify` / `completion.notify` but emits nothing when the agent
// blocks mid-turn waiting for a tool-approval decision (e.g. `tools.approvalMode:
// write | always-ask`). Turn-boundary integrations such as the cmux hooks only
// fire on `agent_end`, so an approval block is invisible to them and the run
// silently stalls.
//
// This extension subscribes to the `tool_approval_requested` event (verified to
// reach a passive subscriber) and raises a desktop notification the moment the
// agent blocks.
//
// Transport:
//   - Inside cmux (CMUX_SOCKET_PATH set): `cmux notify`, which fires the macOS
//     system banner and the cmux notification panel without perturbing the
//     workspace busy/idle state. (OSC 9 is NOT surfaced as a desktop
//     notification by cmux/ghostty, so it is not used there.)
//   - Otherwise: OSC 9 to the controlling terminal, the transport omp core uses
//     (#3687), for plain iTerm2/ghostty sessions.
//
// Body is limited to the tool name (no command text, args, paths, or patch
// content), matching the privacy constraint in #3746.
//
// Env controls:
//   PI_NOTIFICATIONS=off      -> disable all omp notifications (respected here too)
//   OMP_APPROVAL_NOTIFY=off   -> disable only this extension
//   CMUX_OMP_CMUX_BIN         -> override the cmux binary (default `cmux`)
//   OMP_APPROVAL_NOTIFY_TTY   -> override the OSC 9 sink (default /dev/tty)

import { spawn } from "node:child_process";
import fs from "node:fs";
import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";

// Dedup guard so a single blocking call notifies at most once even if the
// approval wrapper is ever re-entered; entries are released on resolve.
const pendingNotifications = new Set<string>();

export default function ompApprovalNotify(pi: ExtensionAPI) {
  pi.on("tool_approval_requested", async (event) => {
    if (process.env.PI_NOTIFICATIONS === "off") return;
    if (process.env.OMP_APPROVAL_NOTIFY === "off") return;
    if (!event || typeof event !== "object") return;

    const toolName = "toolName" in event && typeof event.toolName === "string" ? event.toolName : "a tool";
    const callId = "toolCallId" in event && typeof event.toolCallId === "string" ? event.toolCallId : toolName;
    if (pendingNotifications.has(callId)) return;
    pendingNotifications.add(callId);

    const body = `approval required for ${toolName}`;

    if (process.env.CMUX_SOCKET_PATH) {
      const cmuxBin = process.env.CMUX_OMP_CMUX_BIN || "cmux";
      try {
        const child = spawn(cmuxBin, ["notify", "--title", "Oh My Pi", "--subtitle", "Approval required", "--body", body], {
          stdio: "ignore",
        });
        child.on("error", () => {});
        child.unref();
      } catch {
        // cmux binary unavailable despite the socket env: nothing to do.
      }
      return;
    }

    // Non-cmux terminal: OSC 9 desktop notification (ESC ] 9 ; <body> BEL).
    const osc9 = `\u001b]9;Oh My Pi: ${body}\u0007`;
    const target = process.env.OMP_APPROVAL_NOTIFY_TTY || "/dev/tty";
    try {
      const fd = fs.openSync(target, "a");
      try {
        fs.writeSync(fd, osc9);
      } finally {
        fs.closeSync(fd);
      }
    } catch {
      // No controlling terminal (headless / no UI): nothing to notify. Skipping
      // here matches #3746's "no headless notification" decision.
    }
  });

  pi.on("tool_approval_resolved", async (event) => {
    if (event && typeof event === "object" && "toolCallId" in event && typeof event.toolCallId === "string") {
      pendingNotifications.delete(event.toolCallId);
    }
  });
}
