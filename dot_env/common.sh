# sbin
export PATH="/usr/local/sbin:$PATH"

# Homebrew
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Go
export GOPATH="$HOME/dev/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

# Rust integration
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Homebrew
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Kubectl
source "$HOME/.env/kubeconfig.sh"

# PostgreSQL utils (libpq)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
