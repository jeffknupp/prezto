#
# Provides for an easier use of GPG.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[gpg] || ! $+commands[gpg2] )); then
  return 1
fi

# Source module files.
source "${0:h}/agent.zsh"

# Disable GUI prompts inside CLI.
if [[ -c "$GPG_TTY" ]]; then
  export PINENTRY_USER_DATA='USE_CURSES=1'
fi

