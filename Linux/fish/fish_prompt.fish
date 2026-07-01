# Cobalt2 Theme for Fish Shell
# Based on https://github.com/wesbos/Cobalt2-iterm
# Requires a Powerline-patched font

# Global variables
set -g current_bg NONE
set -g segment_separator ''

# Color definitions (Fish color names)
set -g color_black black
set -g color_blue blue
set -g color_green green
set -g color_yellow yellow
set -g color_red red
set -g color_cyan cyan
set -g color_white white

function prompt_segment -d "Draw a segment of the prompt"
    set -l bg $argv[1]
    set -l fg $argv[2]
    set -l content $argv[3]

    # Set background and foreground
    if test -n "$bg"
        set bg_code (set_color -b $bg)
    else
        set bg_code (set_color normal)
    end

    if test -n "$fg"
        set fg_code (set_color $fg)
    else
        set fg_code (set_color normal)
    end

    # Handle segment separator
    if test "$current_bg" != "NONE" -a "$bg" != "$current_bg"
        echo -n " "(set_color -b $bg)(set_color $current_bg)"$segment_separator"(set_color $fg)" "
    else
        echo -n "$bg_code$fg_code "
    end

    set current_bg $bg
    if test -n "$content"
        echo -n "$content"
    end
end

function prompt_end -d "End the prompt, closing any open segments"
    if test "$current_bg" != "NONE"
        echo -n " "(set_color normal)(set_color $current_bg)"$segment_separator"
    end
    echo -n (set_color normal)
    set current_bg NONE
end

function prompt_context -d "Display user context if needed"
    set -l user (whoami)
    if test "$user" != "$USER" -o -n "$SSH_CLIENT"
        prompt_segment black white "✝"
    end
end

function prompt_git -d "Display git information"
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l dirty ''
        set -l ref (git symbolic-ref HEAD 2>/dev/null | sed 's|refs/heads/||')

        # Refresh the index's cached stat info first, otherwise diff-index
        # can misreport "dirty" right after a checkout due to racy timestamps
        git update-index -q --refresh 2>/dev/null

        # Check if repo is dirty
        if not git diff-index --quiet HEAD -- 2>/dev/null
            set dirty '±'
        end

        # Handle detached head
        if test -z "$ref"
            set ref "➦ "(git show-ref --head -s --abbrev | head -n1 2>/dev/null)
        end

        # Choose color based on dirty status
        if test -n "$dirty"
            prompt_segment yellow black "$ref$dirty"
        else
            prompt_segment green black "$ref$dirty"
        end
    end
end

function prompt_dir -d "Display current directory"
    # Get last directory component (equivalent to %1~ in zsh)
    set -l dir (basename (prompt_pwd))
    prompt_segment blue black "$dir"
end

function prompt_status -d "Display status indicators"
    set -l symbols

    # Check last command exit status
    if test $status -ne 0
        set symbols $symbols (set_color red)"✘"(set_color normal)
    end

    # Check if root
    if test (id -u) -eq 0
        set symbols $symbols (set_color yellow)"⚡"(set_color normal)
    end

    # Check for background jobs
    if jobs -q
        set symbols $symbols (set_color cyan)"⚙"(set_color normal)
    end

    if test (count $symbols) -gt 0
        prompt_segment black white (string join ' ' $symbols)
    end
end

function fish_prompt -d "Main prompt function"
    set -g current_bg NONE
    prompt_status
    prompt_dir
    prompt_git
    prompt_end
    echo -n ' '
end
