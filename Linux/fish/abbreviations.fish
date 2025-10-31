
# fish config
abbr -a -- fs code ~/.config/fish/config.fish
abbr -a -- fss source ~/.config/fish/config.fish
# fish config end

# Ubuntu
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'

abbr -a -- upd sudo apt update
abbr -a -- upg sudo apt upgrade
# Ubuntu end

# git
# Fish Git Abbreviations - oh-my-zsh git plugin equivalent
# Add these to your ~/.config/fish/config.fish

# Helper functions (needed for some abbreviations)
function git_current_branch
    git branch --show-current 2>/dev/null
end

function git_main_branch
    git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'
    or echo "main"
end

function git_develop_branch
    if git show-ref --verify --quiet refs/heads/develop
        echo "develop"
    else if git show-ref --verify --quiet refs/heads/dev
        echo "dev"
    else
        echo "develop"
    end
end

# Basic git abbreviations
abbr -a g git
abbr -a ga 'git add'
abbr -a gaa 'git add --all'

# Branch operations
abbr -a gb 'git branch'
abbr -a gba 'git branch --all'
abbr -a gbd 'git branch --delete'
abbr -a gbD 'git branch --delete --force'
abbr -a gbm 'git branch --move'
abbr -a ggsup 'git branch --set-upstream-to=origin/(git_current_branch)'

# Checkout operations
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gcB 'git checkout -B'
abbr -a gcd 'git checkout (git_develop_branch)'
abbr -a gcm 'git checkout (git_main_branch)'

# Cherry-pick
abbr -a gcp 'git cherry-pick'
abbr -a gcpa 'git cherry-pick --abort'
abbr -a gcpc 'git cherry-pick --continue'

# Clean and commit
abbr -a gclean 'git clean --interactive -d'
abbr -a gc 'git commit --verbose'
abbr -a 'gc!' 'git commit --verbose --amend'
abbr -a gcf 'git config --list'
abbr -a gcfu 'git commit --fixup'

# Diff and fetch
abbr -a gd 'git diff'
abbr -a gf 'git fetch'
abbr -a gfa 'git fetch --all --tags --prune'
abbr -a gfo 'git fetch origin'

# Log operations
abbr -a glgg 'git log --graph'
abbr -a glgga 'git log --graph --decorate --all'
abbr -a glgm 'git log --graph --max-count=10'
abbr -a glod 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
abbr -a glods 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
abbr -a glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
abbr -a glola 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
abbr -a glols 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
abbr -a glo 'git log --oneline --decorate'
abbr -a glog 'git log --oneline --decorate --graph'
abbr -a gloga 'git log --oneline --decorate --graph --all'
abbr -a glg 'git log --stat'
abbr -a glgp 'git log --stat --patch'

# Merge operations
abbr -a gm 'git merge'
abbr -a gma 'git merge --abort'
abbr -a gmc 'git merge --continue'
abbr -a gms 'git merge --squash'
abbr -a gmff 'git merge --ff-only'
abbr -a gmom 'git merge origin/(git_main_branch)'
abbr -a gmum 'git merge upstream/(git_main_branch)'

# Pull operations
abbr -a gl 'git pull'
abbr -a gpr 'git pull --rebase'
abbr -a gprv 'git pull --rebase -v'
abbr -a gpra 'git pull --rebase --autostash'
abbr -a gprav 'git pull --rebase --autostash -v'
abbr -a gprom 'git pull --rebase origin (git_main_branch)'
abbr -a gpromi 'git pull --rebase=interactive origin (git_main_branch)'
abbr -a gprum 'git pull --rebase upstream (git_main_branch)'
abbr -a gprumi 'git pull --rebase=interactive upstream (git_main_branch)'
abbr -a ggpull 'git pull origin (git_current_branch)'
abbr -a ggl 'git pull origin (git_current_branch)'
abbr -a gluc 'git pull upstream (git_current_branch)'
abbr -a glum 'git pull upstream (git_main_branch)'

# Push operations
abbr -a gp 'git push'
abbr -a gpd 'git push --dry-run'
abbr -a 'gpf!' 'git push --force'
abbr -a ggf 'git push --force origin (git_current_branch)'
abbr -a gpf 'git push --force-with-lease'
abbr -a ggfl 'git push --force-with-lease origin (git_current_branch)'
abbr -a gpsup 'git push --set-upstream origin (git_current_branch)'
abbr -a gpsupf 'git push --set-upstream origin (git_current_branch) --force-with-lease'
abbr -a gpv 'git push --verbose'
abbr -a gpoat 'git push origin --all && git push origin --tags'
abbr -a gpod 'git push origin --delete'
abbr -a ggpush 'git push origin (git_current_branch)'
abbr -a ggp 'git push origin (git_current_branch)'
abbr -a gpu 'git push upstream'

# Rebase operations
abbr -a grb 'git rebase'
abbr -a grba 'git rebase --abort'
abbr -a grbc 'git rebase --continue'
abbr -a grbi 'git rebase --interactive'
abbr -a grbo 'git rebase --onto'
abbr -a grbs 'git rebase --skip'
abbr -a grbd 'git rebase (git_develop_branch)'
abbr -a grbm 'git rebase (git_main_branch)'
abbr -a grbom 'git rebase origin/(git_main_branch)'
abbr -a grbum 'git rebase upstream/(git_main_branch)'

# Remote operations
abbr -a grf 'git reflog'
abbr -a gr 'git remote'
abbr -a grv 'git remote --verbose'
abbr -a gra 'git remote add'
abbr -a grrm 'git remote remove'
abbr -a grmv 'git remote rename'
abbr -a grset 'git remote set-url'
abbr -a grup 'git remote update'

# Reset operations
abbr -a grh 'git reset'
abbr -a gru 'git reset --'
abbr -a grhh 'git reset --hard'
abbr -a grhk 'git reset --keep'
abbr -a grhs 'git reset --soft'
abbr -a gpristine 'git reset --hard && git clean --force -dfx'
abbr -a gwipe 'git reset --hard && git clean --force -df'
abbr -a groh 'git reset origin/(git_current_branch) --hard'

# Restore operations
abbr -a grs 'git restore'
abbr -a grss 'git restore --source'
abbr -a grst 'git restore --staged'

# Revert and remove
abbr -a gunwip 'git rev-list --max-count=1 --format="%s" HEAD | grep -q "--wip--" && git reset HEAD~1'
abbr -a grev 'git revert'
abbr -a grm 'git rm'
abbr -a grmc 'git rm --cached'

# Show and stats
abbr -a gcount 'git shortlog --summary -n'
abbr -a gsh 'git show'
abbr -a gsps 'git show --pretty=short --show-signature'

# Stash operations
abbr -a gstall 'git stash --all'
abbr -a gstu 'git stash --include-untracked'
abbr -a gstaa 'git stash apply'
abbr -a gstc 'git stash clear'
abbr -a gstd 'git stash drop'
abbr -a gstl 'git stash list'
abbr -a gstp 'git stash pop'
abbr -a gsta 'git stash push'
abbr -a gsts 'git stash show --patch'

# Status operations
abbr -a gst 'git status'
abbr -a gss 'git status --short'
abbr -a gsb 'git status --short -b'

# Submodule operations
abbr -a gsi 'git submodule init'
abbr -a gsu 'git submodule update'

# SVN operations
abbr -a gsd 'git svn dcommit'
abbr -a gsr 'git svn rebase'

# Switch operations
abbr -a gsw 'git switch'
abbr -a gswc 'git switch -c'
abbr -a gswd 'git switch (git_develop_branch)'
abbr -a gswm 'git switch (git_main_branch)'

# Tag operations
abbr -a gta 'git tag --annotate'
abbr -a gts 'git tag -s'
abbr -a gtv 'git tag | sort -V'

# Worktree operations
abbr -a gwt 'git worktree'
abbr -a gwtls 'git worktree list'
abbr -a gwtmv 'git worktree move'
abbr -a gwtrm 'git worktree remove'
# git end
