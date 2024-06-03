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

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# kubectl completion
if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
fi

# GCloud
if [ -f "${HOME}/.local/google-cloud-sdk/path.zsh.inc" ]; then
  . "${HOME}/.local/google-cloud-sdk/path.zsh.inc"; # This updates PATH for the Google Cloud SDK.
fi
if [ -f "${HOME}/.local/google-cloud-sdk/completion.zsh.inc" ]; then
  . "${HOME}/.local/google-cloud-sdk/completion.zsh.inc"; # This enables shell command completion for gcloud.
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
