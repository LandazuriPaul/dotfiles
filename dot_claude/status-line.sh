#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
dir=$(basename "$cwd")

# Model: prefer display_name, fallback to short name from id
model=$(echo "$input" | jq -r '.model.display_name // empty')
if [ -z "$model" ]; then
  model_id=$(echo "$input" | jq -r '.model.id // "unknown"')
  case "$model_id" in
    *opus*) model="opus" ;;
    *sonnet*) model="sonnet" ;;
    *haiku*) model="haiku" ;;
    *) model="$model_id" ;;
  esac
fi

# Git info
git_info=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" -c gc.autodetach=0 -c core.useBuiltinFSMonitor=0 branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git -C "$cwd" -c gc.autodetach=0 -c core.useBuiltinFSMonitor=0 rev-parse --short HEAD 2>/dev/null)

  if [ -n "$branch" ]; then
    # Strip branch suffix from dir name (worktree pattern: repo.branch-with-slashes-as-dashes)
    branch_dashed=$(echo "$branch" | tr '/' '-')
    stripped="${dir%.${branch_dashed}}"
    [ "$stripped" != "$dir" ] && dir="$stripped"

    # Dirty indicator
    if ! git -C "$cwd" -c gc.autodetach=0 -c core.useBuiltinFSMonitor=0 diff-index --quiet HEAD -- 2>/dev/null; then
      dirty="✗"
    else
      dirty="✓"
    fi

    # Truncate long branch names
    if [ ${#branch} -gt 30 ]; then
      branch_display="${branch:0:30}…"
    else
      branch_display="$branch"
    fi

    git_info=" ${branch_display} ${dirty}"
  fi
fi

# Vim mode + output style
extra=""
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
[ -n "$vim_mode" ] && extra=" [${vim_mode}]"
output_style=$(echo "$input" | jq -r '.output_style.name')
[ "$output_style" != "default" ] && extra="${extra} ${output_style}"

# Context bar
ctx=""
usage=$(echo "$input" | jq '.context_window.current_usage')
if [ "$usage" != "null" ] && [ -n "$usage" ]; then
  current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
  size=$(echo "$input" | jq '.context_window.context_window_size')
  pct=$((current * 100 / size))
  filled=$((pct / 10))
  empty=$((10 - filled))
  bar=""
  i=0; while [ $i -lt $filled ]; do bar="${bar}▓"; i=$((i + 1)); done
  i=0; while [ $i -lt $empty ]; do bar="${bar}░"; i=$((i + 1)); done
  ctx=" ${bar} ${pct}%"
fi

printf " %s (%s)%s%s%s" "$dir" "$model" "$git_info" "$extra" "$ctx"
