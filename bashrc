# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# MinGW doesn't have a native $USER variable
USER=$(whoami)


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto --ignore="NTUSER.DAT*"' # and hide NTUSER.DAT* files
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

### GITPROMPT CONFIGURATION
#GIT_PROMPT_ONLY_IN_REPO=0
#GIT_PROMPT_THEME=Single_line
#[ -f ~/git/.bash-git-prompt/gitprompt.sh ] && source ~/git/.bash-git-prompt/gitprompt.sh

# POWERPROMPT CONFIGURATION
[ -f ~/.shell_prompt.sh ] && source ~/.shell_prompt.sh