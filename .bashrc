# my keyboard shortcuts

    # Alt-u is 'go to upper dir'
    #(\eu is Alt-u, C-m is Ctrl-m)
    bind '"\eu":"cd ..\C-m"'

    # prepare to type a quoted word
    # insert open and close double quotes
    # and move to just after the open quote
    bind '"\C-x\"":"\"\"\C-b"'

    # A-r searches backward for lines BEGINNING with your searched string (normal
    # C-r searches anywhere in the line for your searched string) (VERY USEFUL)
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

    alias update='sudo apt-get update'

    alias home='cd ~'
    alias h='cd ~'
    alias downloads='cd /cygdrive/g/downloads'
    alias d='cd /cygdrive/g/downloads'
    alias comp='cd /cygdrive/z/computers'
    alias first='cd /cygdrive/z'
    alias security='cd /cygdrive/g/apps2/DropboxPortableAHK2/Dropbox/security'
    alias s='cd /cygdrive/g/apps2/DropboxPortableAHK2/Dropbox/security'
    alias linux='cd /cygdrive/z/computers/linux'
    alias bashrc='vim /cygdrive/z/home/.bashrc'
    alias b='vim /cygdrive/z/home/.bashrc'
    alias proj='cd /cygdrive/z/proj'
    alias tcl='cd /cygdrive/z/proj/tcl'
    alias short='cd /cygdrive/z/proj/tcl/runMyShortcut'
    alias p='cd /cygdrive/z/proj/python'
    alias temp='cd /cygdrive/g/temp'
    alias tmep='cd /cygdrive/g/temp'
    alias mtep='cd /cygdrive/g/temp'
    alias t='cd /cygdrive/g/temp'
    alias dom='cd /cygdrive/z/home'
    alias bin='cd /cygdrive/z/home/bin'
    alias vimrc='vim /cygdrive/z/home/.vimrc'
    alias vimplugins='cd /cygdrive/z/home/.vim/bundle'
    alias vimdir='cd /cygdrive/z/home/.vim'
    alias startvim='vim --servername MyServer'
    #alias v='vim --servername MyServer'
    #alias v='/cygdrive/g/apps/64/vim/vim73/gvim.exe --remote-silent'
    alias boxcryptor='encfs /cygdrive/g/apps2/DropboxPortableAHK1/Dropbox/docs /cygdrive/z'
    alias vimrcnone='vim -u NONE'
    alias standup='cd /cygdrive/g/inne/standup'
    alias ff='/cygdrive/g/apps2/FirefoxPortable/FirefoxPortable.exe'
    alias hosts='vim  /cygdrive/z/myhostsfile'
    alias reference='cd /cygdrive/g/apps2/DropboxPortableAHK2/Dropbox'
    alias r='cd /cygdrive/g/apps2/DropboxPortableAHK2/Dropbox'

    alias notescomputers='cd /cygdrive/z/computers'
    alias notesjava='cd /cygdrive/z/computers/java'
    alias javanotes='cd /cygdrive/z/computers/java'
    alias notesvim='cd /cygdrive/z/computers/vim'
    alias vimnotes='cd /cygdrive/z/computers/vim'
    alias noteslinux='cd /cygdrive/z/computers/linux'
    alias notesbash='cd /cygdrive/z/computers/bash'
    alias noteshtml='cd /cygdrive/z/computers/html'
    alias notesapps='cd /cygdrive/z/computers/apps'
    alias notesahk='cd /cygdrive/z/computers/autohotkey'
    alias notesdom='cd /cygdrive/z/computers/dom'
    alias notesjs='cd /cygdrive/z/computers/javascript'
    alias notesnetworking='cd /cygdrive/z/computers/networking'
    alias notesphp='cd /cygdrive/z/computers/php'
    alias notespython='cd /cygdrive/z/computers/python'
    alias notesruby='cd /cygdrive/z/computers/ruby'
    alias notessecurity='cd /cygdrive/z/computers/security'
    alias notestcl='cd /cygdrive/z/computers/tcl'
    alias notestk='cd /cygdrive/z/computers/tk'
    alias noteswindows='cd /cygdrive/z/computers/windows'

    alias projjava='cd /cygdrive/z/proj/java'

    alias pak='7z -pdupajasia -mhe a temp.7z '

    #   alias home='cd ~'
    #   alias h='cd ~'
    #   alias downloads='cd /media/truecrypt1/downloads'
    #   alias d='cd /media/truecrypt1/downloads'
    #   alias comp='cd /media/truecrypt1/docs/computers'
    #   alias first='cd /media/truecrypt1/docs'
    #   alias security='cd /media/truecrypt1/apps2/DropboxPortableAHK2/Dropbox/security'
    #   alias linux='cd /media/truecrypt1/docs/computers/linux'
    #   alias bashrc='vim /media/truecrypt1/docs/home/.bashrc'
    #   alias b='vim /media/truecrypt1/docs/home/.bashrc'
    #   alias proj='cd /media/truecrypt1/docs/proj'
    #   alias tcl='cd /media/truecrypt1/docs/proj/tcl'
    #   alias short='cd /media/truecrypt1/docs/proj/tcl/runMyShortcut'
    #   alias p='cd /media/truecrypt1/docs/proj/python'
    #   alias temp='vim  /media/truecrypt1/docs/temp.txt'
    #   alias tmep='vim  /media/truecrypt1/docs/temp.txt'
    #   alias mtep='vim  /media/truecrypt1/docs/temp.txt'
    #   alias t='vim  /media/truecrypt1/docs/temp.txt'
    #   alias dom='cd /media/truecrypt1/docs/home'
    #   alias bin='cd /media/truecrypt1/docs/home/bin'
    #   alias vimrc='vim /media/truecrypt1/docs/home/.vimrc'
    #   alias vimplugins='cd /media/truecrypt1/docs/home/.vim/bundle'
    #   alias vimdir='cd /media/truecrypt1/docs/home/.vim'
    #   alias startvim='vim --servername MyServer'
    #   #alias v='vim --servername MyServer'
    #   alias v='vim'
    #   alias boxcryptor='encfs /media/truecrypt1/apps2/DropboxPortableAHK1/Dropbox/docs /media/truecrypt1/docs'
    #   alias vimrcnone='vim -u NONE'
    #   alias standup='cd /media/truecrypt1/inne/standup'
    #   alias ff='firefox'
    #   alias hosts='vim  /media/truecrypt1/docs/myhostsfile'
    #   alias reference='cd /media/truecrypt1/apps2/DropboxPortableAHK2/Dropbox'
    #   alias r='cd /media/truecrypt1/apps2/DropboxPortableAHK2/Dropbox'
    #   alias docs='cd /media/truecrypt1/docs'

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

    alias "rm=trash"
    alias "emptytrash=/bin/rm -rf /media/truecrypt1/.trashcan/* /media/truecrypt1/.trashcan/.??*"
    alias 'rm!=/bin/rm -r'

    #Make info use vi-like and less-like key bindings:
    alias info='info --vi-keys'


# functions

    # mkdir and cd at the same time
    function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

    #wcd ()
    #{
        #/usr/bin/wcd.exec "$@"
        #. ${WCDHOME:-${HOME}}/bin/wcd.go
    #}

    function v() {
        # cygpath doen't work when you give it non-existant path
        # so let's use sed
        #arg=`cygpath -d $1`

        arg=`echo $1 | sed 's|/cygdrive/||g'`
        arg=`echo $arg | sed 's|/|:\\\|'`
        arg=`echo $arg | sed 's|/|\\\|g'`
        #echo \"$arg\"

        /cygdrive/g/apps/64/vim/vim73/gvim.exe --remote-silent "$arg"
    }

    function g() {
        #grep -ir "$@" *
        #ack "$@"
        ack --smart-case "$@"
    }

    # Trash support by Matt Carter <m@ttcarter.com
    # Source and information: http://hash-bang.net/2009/03/trash-with-bash
    function trash() {
        if [ -d "/media/truecrypt1/.trashcan/$1" ]; then
            # Already exists in binaries - remove
            rm -r "/media/truecrypt1/.trashcan/$1"
        fi
        #mv --target-directory=/media/truecrypt1/.trashcan/ -- "$@"
        mv --target-directory=/cygdrive/g/.trashcan/ -- "$@"
    }

# Turn off pausing output to screen with C-s coz this conflicts with Bash own
# shortcut C-s, which is search history forward incrementally (I prefer to have
# the searching shortcut, I don't suspend often)
stty -ixon

# Auto "cd" when entering just a path
shopt -s autocd

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

    if [ -d "${HOME}/bin" ] ; then
        PATH="${HOME}/bin:${PATH}"
    fi

    PATH="/cygdrive/g/apps/ant/bin:${PATH}" # ant

    # Append dir with my scripts to PATH (path to binaries):
    #PATH=${PATH}:/media/truecrypt1/docs/home/bin

    CLASSPATH=.\;${CLASSPATH}
    CLASSPATH=g:\\apps2\\DropboxPortableAHK2\\Dropbox\\programming\\java\\Thinking_in_java_4_code\;${CLASSPATH}

    export short='G:/apps2/DropboxPortableAHK2/Dropbox/security/docs/proj/tcl/runMyShortcut'
    export bin='G:/apps2/DropboxPortableAHK2/Dropbox/security/docs/home/bin'
    export dom='G:/apps2/DropboxPortableAHK2/Dropbox/security/docs/home'
    export reference='G:/apps2/DropboxPortableAHK2/Dropbox/security'
    export security='G:/apps2/DropboxPortableAHK2/Dropbox/security'
    export s='G:/apps2/DropboxPortableAHK2/Dropbox/security'
    export standup='G:/apps2/DropboxPortableAHK2/Dropbox/security/inne/standup'
    export music='G:/apps2/DropboxPortableAHK2/Dropbox/security/music'
    export linux='G:/apps2/DropboxPortableAHK2/Dropbox/security/docs/computers/linux'
    export first='G:/apps2/DropboxPortableAHK2/Dropbox/security/docs'
    export vimplugins='G:/apps2/DropboxPortableAHK2/Dropbox/security/docs/home/.vim/bundle'

    export TERM="xterm-256color"

# source others stuff

    source acd_func.sh

