# ---
# --- Terminal
# ---

# Fuzzy finder integration
if [ -x "$(command -v fzf)" ]; then
  source <(fzf --zsh)
fi

# zoxide integration
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# ---
# --- Languages
# ---

# Rust integration
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Pyenv integration
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# jEnv integration
if [ -x "$(command -v jenv)" ]; then
    eval "$(jenv init -)"
fi

# sdkman integration
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# nvm
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

# ---
# --- Tools
# ---

# Task completion
if [ -x "$(command -v task)" ]; then
    autoload -U compinit
    compinit -i
fi

if [ -x "$(command -v ngrok)" ]; then
    eval "$(ngrok completion)"
fi

# Docker
if [ -x "$(command -v docker)" ]; then
  export FPATH="$HOME/.docker/completions:$FPATH"
fi

# ---
# --- DevOps
# ---

# kubectl completion
if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
fi

# kubeswitch
if [ -x "$(command -v switcher)" ]; then
  source <(switcher init zsh)
  source <(switch completion zsh)
fi

# AWS
if [ -x "$(command -v assume)" ]; then
  alias assume=". assume"
fi

# GCloud
if [ -f "${HOME}/.local/google-cloud-sdk/path.zsh.inc" ]; then
  . "${HOME}/.local/google-cloud-sdk/path.zsh.inc"; # This updates PATH for the Google Cloud SDK.
fi
if [ -f "${HOME}/.local/google-cloud-sdk/completion.zsh.inc" ]; then
  . "${HOME}/.local/google-cloud-sdk/completion.zsh.inc"; # This enables shell command completion for gcloud.
fi

# Nebius
if [ -d "${HOME}/.nebius" ]; then
  export PATH="${HOME}/.nebius/bin:$PATH"
fi
if [ -f "${HOME}/.nebius/completion.zsh.inc" ]; then
  source "${HOME}/.nebius/completion.zsh.inc"
fi

# Stern completion
if [ -x "$(command -v stern)" ]; then
  source <(stern --completion=zsh)
fi
