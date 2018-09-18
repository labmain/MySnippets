# ZSH的环境变量
export ZSH=/Users/dawang/.oh-my-zsh
# 主题设置
# 主题列表在 ~/.oh-my-zsh/themes/
# 如果设置为 "random", 每次开启都会是不同的主题
ZSH_THEME="agnoster"
# 如果想要大小写敏感，可以取消注释下面的一行
# CASE_SENSITIVE="true"
# 如果想要连接符不敏感，可以取消注释下面的一行。_ 和 - 将可以互换
# HYPHEN_INSENSITIVE="true"
# 如果不想要自动更新，可以取消注释下面的一行
# DISABLE_AUTO_UPDATE="true"
# 自动更新的时间间隔，单位是天，这里设置 30 天更新一次
export UPDATE_ZSH_DAYS=30
# 如果不想要 ls 命令输出带颜色，可以取消注释下面的一行
# DISABLE_LS_COLORS="true"
# 是否禁止更改终端标题,不要禁止,不然所有终端tab只显示zsh了,而不随着目录的改变而改变显示
# DISABLE_AUTO_TITLE="true"
# 自动纠正命令,不启用,不怎么好用
# ENABLE_CORRECTION="true"
# 按tab键补全命令的时候,如果没什么可补全的就会出现三个红点,更人性化显示，这里我们启用
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# 不要在意这些细节，不需要改动
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# 历史命令日期显示格式
# 有三种方式: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"，我比较习惯最后那种
HIST_STAMPS="yyyy-mm-dd"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# 插件设置，如果添加太多启动速度会比较慢
plugins=(git autojump)
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh
# 剩下部分比较不常改动
# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
