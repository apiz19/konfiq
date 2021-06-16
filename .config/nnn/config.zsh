n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

nt ()
{
    tmux new-session nnn -dcErx $@
}

export TERM=xterm-256color
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPENER=nuke
export NNN_TRASH=trash-cli
export NNN_OPTS="cErx"
NNN_USEPLUG='d:diffs;D:dragdrop;f:fzcd;F:fd;J:autojump;R:rg;o:fzopen;O:organize;t:preview-tabbed;T:preview-tui-ext;U:upload;v:imgview'
export NNN_PLUG="$NNN_USEPLUG"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
export NNN_BMS='T:~/Documents/TGA;E:~/Ebooks/'
export NNN_COLORS='1234'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
