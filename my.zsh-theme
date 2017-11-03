# Prompt element configuration
local user="%F{165}%n%f"
local host="%F{163}%M%f"
local path_string="%F{161}%~%f"
local prompt_char="»"

# Make prompt_char red if the previous command failed.
local return_status="%(?:$prompt_char:%{$fg[red]%}$prompt_char)"

# Form left hand prompt
PROMPT='%B${user}@${host}[${path_string}] %# ${return_status} %b'

# Stolen from github.com/zhaorz
# Requires powerline fonts for glyph to display correctly
# Git plugin configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}* %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

git_custom_prompt() {
  local branch=$(current_branch)
  if [ -n "$branch" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$branch$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Form right hand prompt
RPROMPT='$(git_custom_prompt)'
