function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

# GIT
alias commit 'git commit'
alias restore 'git restore'
alias check 'git checkout'
alias add 'git add'
alias stat 'git status'
alias push 'git push'
alias pull 'git pull'
alias branch 'git branch'
alias merge 'git merge'
alias restore-mode 'git diff -p -R --no-ext-diff --no-color --diff-filter=M \
  | grep -E "^(diff|(old|new) mode)" --color=never \
  | git apply'
alias giff 'git diff'

# UTILITY
alias j 'julia --project=.'
alias jl './bin/run_julia'
alias q exit
alias rc 'nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish'
alias pac pacman
alias pamcan pacman
alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"

# NEOVIM
alias nplugin 'nvim ~/.config/nvim/lua/plugins/user.lua'
function code
    cd ~/Code/$argv[1] && nvim .
end

# REUSE
alias mpl 'reuse annotate --copyright="Bart van de Lint <bart@vandelint.net>" --license="MPL-2.0"'

# function dev
#     set dir $argv[1]
#     if not test -d "/home/bart/Code/$dir"
#         echo "Error: Directory '/home/bart/$dir' not found."
#         return 1
#     end
#     kitty --directory "/home/bart/Code/$dir" &
#     cd "/home/bart/Code/$dir"
#     helix .
# end
