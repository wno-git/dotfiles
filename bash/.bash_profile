# Interactive login shells should source bashrc
case "$-" in
    *i*)
        if [ -r ~/.bashrc ]; then
            . ~/.bashrc
        fi
        ;;
esac

PATH="$HOME/bin:$PATH"
