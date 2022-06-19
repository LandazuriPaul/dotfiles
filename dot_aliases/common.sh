# Chezmoi
alias cm="chezmoi"

# General aliases
alias git='LANG=en_GB.UTF-8 git'
alias ..='cd ..'
alias ll='ls -lAhFGW'
alias top='htop'
alias md='mkdir'
alias otop='/usr/bin/top'
alias nv='nvim'

# Mac specifics
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Network
alias flush-dns='sudo killall -HUP mDNSResponder'

# PC specifics
alias tmp='cd ~/dev/tmp/'
alias dev='cd ~/dev/'
alias utils='cd ~/dev/utils/'

# Yarn
alias yb='yarn build'
alias yd='yarn dev'
alias yw='yarn watch'
alias ys='yarn start'
alias ysd='yarn start:dev'
alias ysp='yarn start:prod'

# NPM
alias ns='npm run start'
alias nsd='npm run start:dev'
alias nsp='npm run start:prod'
alias nb='npm run build'

# DevOps tools
alias kb='kubectl'
alias kc='kubectx'
alias tf='terraform'
alias tf='terraform'
alias dc='docker-compose'
