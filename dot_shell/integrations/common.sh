# Fuzzy finder integration
if [ -x "$(command -v fzf)" ]; then
  source <(fzf --zsh)
fi

# zoxide integration
eval "$(zoxide init --cmd cd zsh)"

# Rust integration
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Pyenv integration
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# jEnv integration
if [ -x "$(command -v jenv)" ]; then
    eval "$(jenv init -)"
fi

# sdkman integration
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PATH="$PNPM_HOME:$PATH"

# Docker
if [ -x "$(command -v docker)" ]; then
  export FPATH="$HOME/.docker/completions:$FPATH"
fi

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

# Terraform completion
if [ -x "$(command -v terraform)" ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C terraform terraform
fi

# Stern completion
if [ -x "$(command -v stern)" ]; then
  source <(stern --completion=zsh)
fi

# Task completion
if [ -x "$(command -v task)" ]; then
    autoload -U compinit
    compinit -i
fi

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
