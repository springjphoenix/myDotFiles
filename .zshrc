# Path to your oh-my-zsh installation.
export ZSH=/Users/spring/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="steeef"

ZSH_DISABLE_COMPFIX=true

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z cp colored-man-pages zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export M2_HOME=/opt/apache-maven-3.2.5
export GRADLE_HOME=/opt/gradle-3.2.1
export AXIS_HOME=/opt/axis2-1.7.3
export ANDROID_HOME=/Users/spring/Library/Android/sdk
export ZK_HOME=/opt/zookeeper-3.4.3
export REDIS_HOME=/opt/redis-3.2.9
export NGROK=~/Applications/ngrok
export GCLOUD_HOME=/opt/google-cloud-sdk
export PATH=$GCLOUD_HOME/bin:$NGROK:$JAVA_HOME/bin:$M2_HOME/bin:$GRADLE_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$AXIS_HOME/bin:/opt/mongodb-osx-x86_64-3.4.4/bin:$ZK_HOME/bin:$REDIS_HOME/src:$PATH
# export EDITOR=subl
export EDITOR=vim

export PATH="/usr/local/sbin:$PATH:/usr/local/opt/inetutils/libexec/gnubin"
export MANPATH="/usr/local/opt/inetutils/libexec/gnuman:$MANPATH"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# 解决链接服务器乱码
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias copy="tr -d '\n' | pbcopy"
alias mi="mvn clean install -DskipTests=true"
alias md="mvn clean deploy -DskipTests=true"
alias mdt="mvn dependency:tree"
alias mysql="/usr/local/mysql/bin/mysql"
alias connectDB='ssh -p 8022 -v -L38080:localhost:38080 hopdeploy@10.135.16.65  -t ssh -v -L38080:10.159.38.136:1521 fintech@10.138.8.204 cat -'
alias csgDB='ssh -p 8022 -v -L33306:10.138.232.159:3310 hopdeploy@10.135.16.65'
alias cTest='ssh -p 8022 -v -L11521:10.135.22.104:1521 hopdeploy@10.135.16.65'


# tabtab source for jhipster package
# uninstall by removing these lines or running `tabtab uninstall jhipster`
[[ -f /Users/spring/.config/yarn/global/node_modules/tabtab/.completions/jhipster.zsh ]] && . /Users/spring/.config/yarn/global/node_modules/tabtab/.completions/jhipster.zsh


# ssh forword
function ssh2() {
    if [ $# -eq 0 ]; then
        echo 'usage: ssh2 xxx.xxx.xxx.xxx(ip address)'
    else
        ssh -l hopdeploy -p 8022 -L 7777:$1:22 10.135.16.65 cat -
    fi
}

# convert utf to gbk
function convert() {
	for f in "$@"; do
		if [ -f "$f" ]; then
			iconv -s -c -f UTF8 -t GBK "$f" > /tmp/iconv.utf8.gbk.tmp
			mv /tmp/iconv.utf8.gbk.tmp "$f"
			echo "$f converted to GBK"
		fi
	done
}

# split file every n lines
function sp() {
	if [ $# -lt 3 ]; then
			echo 'usage: sp 100 file_name new_file_name'
	else
		local LINES=$1
		local FILE_NAME=$2
		local NEW_FILE_NAME=$3
		awk 'BEGIN{getline f;}NR%'$LINES'==2{x="'$NEW_FILE_NAME'"++i".csv";a[i]=x;print f>x;print x;}{print > x}' $FILE_NAME
	fi
}
