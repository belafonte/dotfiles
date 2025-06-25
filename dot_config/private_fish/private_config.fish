if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -g fish_greeting ""

set -x PGUSER jpistor
set -x PGPORT 5415
# set -x TERM xterm-256color
# This is needed, htat clojure uses .config folder instead of home dir
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_STATE_HOME $HOME/.local/state

set -x CARGO_HOME $XDG_CACHE_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

set -x ASDF_CONFIG_FILE $XDG_CONFIG_HOME/asdf/asdfrc
set -x ASDF_DATA_DIR $XDG_DATA_HOME/asdf

set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/config
set -x NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
set -x NPM_CONFIG_TMP /tmp
set -x PSQLRC $HOME/.config/postgresql/psqlrc


# Remove $HOME/.asdf/shims from PATH if it exists
set PATH (string match -v "$HOME/.asdf/shims" $PATH)
# Prepend $HOME/.local/share/asdf/shims to the PATH
set -gx PATH $HOME/.local/share/asdf/shims $PATH

# set -x BW_SESSION $(bw login "pistor.jan@gmail.com" --raw)

set -x DYLD_LIBRARY_PATH (brew --prefix)/lib
set -gx GPG_TTY (tty)


# fish_vi_key_bindings

# aliases
alias lg='lazygit'
alias lll='eza --all --icons -l'
alias llg='eza --all --icons -l --grid'
alias llt='eza -TL 2'
alias lazy="NVIM_APPNAME=lazyvim nvim"
alias neo="NVIM_APPNAME=astronvim5 nvim"

alias tp="tmux new -A -s (pwd | sed 's/.*\///g')"




# abbreviations
 # abbr --add cdc cd ~/Documents/Code
abbr tn "tmux new -A -s (pwd | sed 's/.*\///g')"
# abbr tn4 "tmux new -A -s (pwd | sed 's/.*\///g') \; \split-window -v \; \split-window -h \; \select-pane -t 1 \; \split-window -h"
abbr su 'env TERM=xterm-256color su'
abbr ssh 'env TERM=xterm-256color ssh'
abbr cd 'z'

### leihs specific
abbr dbdev 'DB_NAME=leihs_dev'
abbr dbtest 'DB_NAME=leihs_test'
abbr rrs "DB_NAME=leihs_test ./bin/rspec "
abbr chezmoi "SHELL=fish chezmoi"
abbr --set-cursor testl "DB_NAME=leihs_dev bin/rspec ./spec/%"

### madek specific
abbr --set-cursor testm 'DB_NAME=madek_test bin/rspec ./spec/%'


function tn2
    set session_name (pwd | sed 's/.*\///g')
    if tmux has-session -t $session_name 2>/dev/null
        tmux attach -t $session_name
    else
        tmux new -s $session_name \; \
        split-window -h \; \
        select-pane -t 1
    end
end

function tn3
    set session_name (pwd | sed 's/.*\///g')
    if tmux has-session -t $session_name 2>/dev/null
        tmux attach -t $session_name
    else
        tmux new -s $session_name \; \
        split-window -h \; \
        split-window -v \; \
        select-pane -t 1
    end
end

function tn4
    set session_name (pwd | sed 's/.*\///g')
    if tmux has-session -t $session_name 2>/dev/null
        tmux attach -t $session_name
    else
        tmux new -s $session_name \; \
        split-window -v \; \
        split-window -h \; \
        select-pane -t 1 \; \
        split-window -h \; \
        select-pane -t 1
    end
end

function tmux-git
    set repo_name (git rev-parse --show-toplevel 2> /dev/null)
    if test -n "$repo_name"
        set base_name (basename $repo_name)
        tmux new-session -A -s $base_name
    else
        echo "Not in a Git repository"
    end
end

function launch_kitty_windows
    set cwd (pwd)
    
    kitty @ launch --cwd=$cwd
    sleep 0.5
    kitty @ launch --cwd=$cwd
end


source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Add directories to PATH if they exist
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin
fish_add_path ~/.cache/cargo/bin
fish_add_path /opt/homebrew/opt/postgresql@15/bin

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# bun
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH

if asdf plugin-list | grep java > /dev/null
    source $XDG_DATA_HOME/asdf/plugins/java/set-java-home.fish
end

starship init fish | source
zoxide init fish | source

# Ensure PATH is consistent when running in tmux
if not set -q TMUX
    set -Ux PATH $HOME/bin $PATH
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/jpistor/.lmstudio/bin
