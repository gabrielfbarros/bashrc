export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\033[00m\] $ "

cd /home/<user>/Documents/git

#general
alias c="clear"
alias restart="exec bash"
alias edit="code /home/<user>/.bashrc"
alias this="setsid xdg-open . &>/dev/null"

#git
alias gka="gitk --all &"
alias gco="git checkout"
alias gs="git status"
alias ga="git add -A"
alias gac="git add -A && git commit -m"
alias gf="git fetch origin"
alias gpo="git push origin"
alias email=" git config --global user.email"
alias name=" git config --global user.name"
alias pai="git shortlog -s -n --all --no-merges"

#dotnet
alias dnr="dotnet restore"
alias dnb="dotnet build"
alias dnt="dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=OpenCover"
alias config_cv="dotnet tool install -g dotnet-reportgenerator-globaltool && dotnet tool install dotnet-reportgenerator-globaltool --tool-path tools"
alias cv="reportgenerator "-reports:src/Test/coverage.opencover.xml" "-targetdir:src/Test/reports" "-sourcedirs:src/" -reporttypes:HTML;Cobertura"

#docker
alias dkps="docker ps"
alias dkb="docker build . -t"
alias dkr="docker run"
alias dki="docker images"
alias dclean="docker stop $(docker ps -a -q) & docker rm $(docker ps -a -q) & docker rmi $(docker images -a -q)"

#kubernetes
alias k="kubectl"
alias kg="kubectl get"
alias kgn="kubectl get namespace"
alias kgp="kubectl get pods -o wide -n"
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kdel="kubectl delete"
alias kdelp="kubectl delete pod"
alias kdeln="kubectl delete namespace"

#functions
function gcl {
    git clone $1

	path=$1
	basepath="https://gitbasepath/"
	end=".git"

	myfolder=${path#${basepath}}
	myfolder=${myfolder%${end}}
	
	cd ${myfolder}
}

function repo() {
    path="$(pwd)/"
	basepath="/home/<edit>/Documents/git/"
	myrepo=${path#${basepath}}

	setsid google-chrome https://url.com/${myrepo%%/*} &>/dev/null
}

function pipe() {
    path="$(pwd)/"
	basepath="/home/<user>/Documents/git/"
	myrepo=${path#${basepath}}

	setsid google-chrome https://url.com/${myrepo%%/*}/pipelines &>/dev/null
}

function gcp() {
	setsid google-chrome https://console.cloud.google.com/home/dashboard &>/dev/null
}
