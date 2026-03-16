
export PATH="$HOME/.local/bin:$PATH"

fpath=(~/.zsh/functions $fpath)
autoload -Uz prompt && prompt
