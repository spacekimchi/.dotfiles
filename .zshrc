# alias
alias sz="source ~/.zshrc"
alias vali="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tb="cd ~/workspace/traders"
alias tm="cd ~/workspace/trademaker"
alias jz="cd ~/workspace/jinz.co"
alias ws="cd ~/workspace"
alias brewu="brew services start postgresql@14 && brew services start redis"
alias brewd="brew services stop postgresql@14 && brew services stop redis"
alias tk="~/workspace/tickets/target/release/tickets"
alias aoc="cd ~/workspace/aoc-2023"
alias gmd="cd ~/workspace/game_development"
alias mts="cd ~/workspace/muhtrades"
alias mt="cd ~/workspace/mytradez"
alias be="bundle exec"
alias ts="cd ~/workspace/tradesalsa"

# git aliases
alias gco="git checkout"
alias gs="git status"
alias gcm="git commit -m"
alias ga="git add"
alias gp="git push"
alias gb="git branch"
alias gst="git stash"
alias gsp="git stash pop"
alias gcp="git cherry-pick"

# docker aliases
alias dc="docker-compose"
alias dcbe="docker-compose exec web bundle exec"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/spacekimchis
ssh-add --apple-use-keychain ~/.ssh/jinz

autoload -Uz compinit && compinit
# eval "$(~/.rbenv/bin/rbenv init - zsh)"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,vendor,target,build,tmp,venv}/*" -g "!*.{min.js,swp,o,zip}"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/openssl@1.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
