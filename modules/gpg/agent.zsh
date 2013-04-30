#
# Provides for an easier use of gpg-agent.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[gpg-agent] )); then
  return 1
fi

# Set the default path to the gpg-agent-info file.
_gpg_agent_info="$HOME/.gpg-agent-info"

# Start gpg-agent.
ps -U "$USER" -o 'command' | egrep -q '^gpg-agent( |$)' \
  || gpg-agent --daemon >! "$_gpg_agent_info"

# Export environment variables.
export GPG_TTY="$(tty)"
source "$_gpg_agent_info"

# Clean up.
unset _gpg_agent_info

