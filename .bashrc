# OS判定
if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
fi

# alias
alias fcd='source /usr/local/bin/fcd.sh'
alias l='ls -laGF'
alias lg='ls -laGF | grep --color=auto'
alias sb='source ~/.bashrc'
alias aspell='aspell --lang=en -c -t $1'

if [ $OS == 'Mac' ]; then
    alias o='open'
fi

# Ctrl-wの単語削除をスラッシュ区切りに設定
if [[ -t 1 ]]; then
    stty werase undef
    bind '\C-w:unix-filename-rubout'
fi

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#adb
export PATH="/Users/nyoshida/Library/Android/sdk/platform-tools/:$PATH"
# 補完設定
if [ $OS == 'Mac' ]; then
    if [ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
        source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
    fi
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

# プロンプトに各種情報を表示
is_prompt_available=yes
if [ $OS == 'Mac' ]; then
    if [ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
        source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
    else
        is_prompt_available=
    fi
fi
if [ -n "$is_prompt_available" ]; then
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    export PS1='\[\033[0;32m\]\u@\h\[\033[00m\]:\[\033[0;34m\]\w\[\033[0;35m\]$(__git_ps1)\[\e[1;36m\]\n>\[\033[00m\] '
else
    export PS1='\[\033[0;32m\]\u@\h\[\033[00m\]:\[\033[0;34m\]\w\[\033[0;35m\]\[\e[1;36m\]\n>\[\033[00m\] '
fi

# local設定があるならそちらを優先
if [ -e "${HOME}/.bashrc.local" ]; then
    source "${HOME}/.bashrc.local"
fi

