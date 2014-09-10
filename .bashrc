# my keyboard shortcuts

    # Alt-u is 'go to upper dir'
    #(\eu is Alt-u, C-m is Ctrl-m)
    bind '"\eu":"cd ..\C-m"'

    # prepare to type a quoted word
    # insert open and close double quotes
    # and move to just after the open quote
    bind '"\C-x\"":"\"\"\C-b"'

    # C-r searches anywhere in the line for your searched string) (reverse-i-search) (VERY USEFUL)
    # no need to set it up (it's default in Bash?)

    # A-r searches backward for lines BEGINNING with string you typed 
    bind '"\er":history-search-backward'

    #bind '"\C-f": "this is my tekst"'
    # bind Alt-w to some command (just an example)
    #bind '"\ew"':"\"grep --exclude-dir wp-content -rnH is_singular *\""
    #bind '"\ew"':"ls"'

    # binds CTRL+f to execute ls command.
    # bind '"\C-f": "ls\n"'

    # history-search-forward
    # comment out (I have ś here)
    #bind '"\es":history-search-forward'

# I want tab completion to be case insensitive
bind "set completion-ignore-case on"



# aliases
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'
    alias lc='ls -c'

    alias df='df -h'

    alias home='cd ~'
    alias h='cd ~'


    # typos
    alias exti='exit'

    # Better 'up' shortcuts
    alias up='cd ..'

    alias ..="cd .."
    alias ..2="cd ../.."
    alias ..3="cd ../../.."
    alias ..4="cd ../../../.."
    alias ..5="cd ../../../../.."

    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias .....="cd ../../../.."
    alias ......="cd ../../../../.."

    alias pingl='ping localhost'

    alias 'rm!=/bin/rm -r'

    #Make info use vi-like and less-like key bindings:
    alias info='info --vi-keys'

    alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'



# Turn off pausing output to screen with C-s coz this conflicts with
# Bash own shortcut C-s, which is search history forward
# incrementally (I prefer to have the searching shortcut, I don't
# suspend often)
/bin/stty -ixon

# Auto "cd" when entering just a path
#shopt -s autocd
# (turn it off, confusing, what is there is app with same name as
# your dir?)

# programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    # COMMENT OUT: SLOWES DOWN MINNTY AT STARTUP (this started when I updated
    # Cygwin)
    #  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    #      . /etc/bash_completion
    #  fi

# vim mode (instead of Emacs default)
    # set -o vi

# variables and exports

    export TERM="xterm-256color"

# source others stuff

    # better 'cd' e.g.
    # cd -- (list last 10 dirs)
    # cd -2 (go to second dir)
    source acd_func.sh

    if [ $(/bin/uname) == "CYGWIN_NT-6.1-WOW64" ]; then
        source bash_cygwin_settings
    fi

    if [ $(/bin/uname -n | head -c -1) == "wid7.clear2Pay.com" ]; then

        if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi
        alias weblogic='cd /src/CS/trunk/ofmProfile/domains/soa_domain'
        alias wg='cd /src/CS/trunk/ofmProfile/domains/soa_domain'
        alias cs='cd /src/CS/trunk/svn'
        alias ds='~/dropbox.py status' # dropbox status
        alias dboracle='cd /src/CS/trunk/svn/setup/Database/oracle'
        alias dbclean='cd /src/CS/trunk/svn/setup/Database/oracle/ && export ORACLE_SID=bphclient && ./cleanData.sh && export ORACLE_SID=bphmarket && ./cleanData.sh'
        alias dbupdate='cd /src/CS/trunk/svn/setup/Database/oracle/ && export ORACLE_SID=bphmarket && ./updateDb.sh'
        alias sql='export EDITOR=vi && export ORACLE_SID=bphmarket && sqlplus "bphadmin/password"' # sqlplus
        function v() {
            gvim --remote-silent "$1"
            wmctrl -a GVIM
        }

    fi

    if [ $(/bin/uname -n | head -c -1) == "bulls-ThinkPad-T500" ]; then
        alias docs='cd /media/wbesz/8d0f3e16-3f0c-4efc-9f2d-af5b7f8c7a85/dokumentacja; clear'
        alias domain='cd /src/CS/trunk/ofmProfile/domains/soa_domain; clear'
        alias domain2='cd /src/CS/trunk/ofmProfile/domains/soa_domain2; clear'
        alias domaintemp='cd /src/CS/trunk/ofmProfile/domains/soa_domain_temp; clear'
        alias weblogic='cd /opt/middleware/soasuite11g/wlserver_10.3; clear'
        alias wg='cd /opt/middleware/soasuite11g/wlserver_10.3; clear'
        alias cs='cd /src/CS/trunk/svn; clear'
        alias trunk='cd /src/CS/trunk/svn; clear'
        alias cs21='cd /src/CS/branches/CS-2.1-maintenance; clear'
        alias cs22='cd /src/CS/branches/CS-2.2-maintenance; clear'
        alias cs23='cd /src/CS/branches/CS-2.3-maintenance; clear'
        alias cs13='cd /src/CS/branches/CS-1.3-maintenance; clear'
        #alias ds='~/dropbox.py status; clear' # dropbox status
        alias dboracle='cd /src/CS/trunk/svn/setup/Database/oracle; clear'
        alias dbclean='cd /src/CS/trunk/svn/setup/Database/oracle/ && export ORACLE_SID=bphmarket && ./cleanData.sh && export ORACLE_SID=bphclient && ./cleanData.sh'
        alias dbupdate='cd /src/CS/trunk/svn/setup/Database/oracle/ && export ORACLE_SID=bphmarket && ./updateDb.sh && export ORACLE_SID=bphclient && ./updateDb.sh'
        alias sql='export EDITOR=vi && export ORACLE_SID=bphmarket && sqlplus "bphadmin/password"' # sqlplus
        alias 7up='svn up --ignore-externals'

        #export JAVA_HOME=/opt/middleware/soasuite11g/jdk160_29
        export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
        export CS22=/src/CS/trunk/svn
        export CS21=/src/CS/branches/CS-2.1-maintenance
        export CS13=/src/CS/branches/CS-1.3-maintenance

        export PROMPT_COMMAND='l="`cat /tmp/x`"; exec >/dev/tty; exec > >(tee /tmp/x)'
        # usage:
        # find -name .bashrc
        # ./.bashrc
        # vi $l
    fi


# colors

    # A green prompt for regular users
    #PS1='[\u@\h \W]\$ '  # Default
    PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '



