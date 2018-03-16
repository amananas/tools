#!/bin/bash

PROFILE_VARIABLES=(
'EDITOR="gvim"'
)
PROFILE_ALIASES=(
'drop_caches="sudo sh -c '"'"'echo 1 > /proc/sys/vm/drop_caches; echo 2 > /proc/sys/vm/drop_caches; echo 3 > /proc/sys/vm/drop_caches'"'"'"'
'git_remove_whitespaces="find . -type f -not -iwholename '"'"'*.git*'"'"' -print0 | xargs -0 perl -pi -e '"'"'s/[\t ]+$//'"'"'"'
'whereiscommand="command_not_found_handle"'
'rgrep="grep -r -n -C 2 --color'
'tt="tree -L 3"'
'gdif="git difftool"'
'll="ls --color=auto"'
'rr="ranger"'
)
PROFILE_FUNCTIONS=(
'mak() {
    make $@; notify-send "Make done."
}'
)
PROFILE_SOURCES=(
'/etc/proxy/proxy.conf'
'/etc/zshrc'
)
FILES=(
'.zshrc'
'.zshrc.pre-oh-my-zsh'
)

# Making /etc/profile
echo "\n\n#\n# Global Variables\n#" >> /etc/profile
for variable in "${PROFILE_VARIABLES[@]}"; do echo "export $variable" >> /etc/profile; done
echo "\n\n#\n# Global Aliases\n#" >> /etc/profile
for alias in "${PROFILE_ALIASES[@]}"; do echo "alias $alias" >> /etc/profile; done
echo "\n\n#\n# Global functions\n#" >> /etc/profile
for function in "${PROFILE_FUNCTIONS[@]}"; do echo "function $function" >> /etc/profile; done
echo "\n\n#\n# Global sources\n#" >> /etc/profile
for source in "${PROFILE_SOURCES[@]}"; do echo "source $source" >> /etc/profile; done
echo "source /etc/profile" > ~/.bashrc

# Copy source files
for file in "${FILES[@]}"; do cp "$file" "~/$file"; done

# Set up oh-my-zsh
here=$(pwd)
patches=$(ls "oh-my-zsh_patches")
cd ~/.oh-my-zsh && for patch in "$patch"; do cp "$here/oh-my-zsh_patches/$patch" . ; git apply $patch ; done; cd $here

