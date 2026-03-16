
export PATH="$HOME/.local/bin:$PATH"

# Load custom functions
fpath=(~/.zsh/functions $fpath)
autoload -Uz prompt && prompt
