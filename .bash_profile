export M2_HOME=/usr/share/java/maven-3.0.4
export MAVEN_HOME=/usr/share/java/maven-3.0.4
export LIFERAY_HOME=~/liferay/liferay-portal-6.0.6
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# switches symlink to the current server in liferay to the project you want to run
alias switch2api3='rm -rf ~/liferay/liferay-portal-6.0.6;
                   ln -s ~/liferay/liferay-portal-6.0.6-api ~/liferay/liferay-portal-6.0.6'

alias switch2aptc='rm -rf ~/liferay/liferay-portal-6.0.6;
                   ln -s ~/liferay/liferay-portal-6.0.6-aptc ~/liferay/liferay-portal-6.0.6'

# tells you the current server/project you're working on
alias which='cd ~/liferay/liferay-portal-6.0.6;
             pwd -P'

# starts the server
alias start='cd ~/liferay/liferay-portal-6.0.6/tomcat-6.0.29/bin;
             bash startup.sh'

# kills the server
alias end='cd ~/liferay/liferay-portal-6.0.6/tomcat-6.0.29/bin;
           sudo bash shutdown.sh'

# opens logs for the current project you're on
alias logs='cd ~/liferay/liferay-portal-6.0.6/tomcat-6.0.29/logs;
            tail -f catalina.out'

# maven commands
alias mci='mvn clean install'
alias mld='mvn liferay:deploy'

# shortcuts for rebaseing entire project
alias full-update-aptc='rm -rf ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/temp;
					    mkdir ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/temp;
					    cd ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/webapps;
					    rm -rf -d ap*;
					    rm -rf ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/work;
					    mkdir ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/work;
					    rm -rf ~/liferay/liferay-portal-6.0.6-aptc/deploy;
					    mkdir ~/liferay/liferay-portal-6.0.6-aptc/deploy;
					    cd ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/lib;
					    rm aptc*;
					    rm pacommon*;
					    rm ap-core*;
					    rm validation*;
					    rm gwt*;
					    cd ~/Desktop/Projects/aptc/aptc-artifacts/target;
					    unzip aptc-artifacts-global.zip -d ~/liferay/liferay-portal-6.0.6-aptc/tomcat-6.0.29/lib;
					    unzip aptc-artifacts-portlets.zip -d ~/liferay/liferay-portal-6.0.6-aptc/deploy;
					    rm -rf ~/liferay/liferay-portal-6.0.6;
                        ln -s ~/liferay/liferay-portal-6.0.6-aptc ~/liferay/liferay-portal-6.0.6;
                        cd ~/Desktop/Projects/aptc/'

alias full-update-api3='rm -rf ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/temp;
						mkdir ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/temp;
						cd ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/webapps;
						rm -rf -d ap*;
						rm -rf -d AP*;
						rm -rf ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/work;
						mkdir ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/work;
						rm -rf ~/liferay/liferay-portal-6.0.6-api3/deploy;
					    mkdir ~/liferay/liferay-portal-6.0.6-api3/deploy;
						cd ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/lib;
					    rm ap-core*;
					    rm pacommon*;
						cd ~/Desktop/Projects/api3/api3-artifacts/target;
						unzip api3-artifacts-global.zip -d ~/liferay/liferay-portal-6.0.6-api3/tomcat-6.0.29/lib;
						unzip api3-artifacts-portlets.zip -d ~/liferay/liferay-portal-6.0.6-api3/deploy;
						rm -rf ~/liferay/liferay-portal-6.0.6;
                        ln -s ~/liferay/liferay-portal-6.0.6-api3 ~/liferay/liferay-portal-6.0.6;
                        cd ~/Desktop/Projects/api3/'

# shortcuts to open projects with sublime text
alias subl-open-aptc='subl ~/Desktop/Projects/aptc'
alias subl-open-api3='subl ~/Desktop/Projects/api3'
alias subl-open-apportlet='subl ~/Desktop/Projects/apportlet'

# shortcuts to open projects with textmate
alias mate-open-aptc='mate ~/Desktop/Projects/aptc'
alias mate-open-api3='mate ~/Desktop/Projects/api3'
alias mate-open-apportlet='mate ~/Desktop/Projects/apportlet'

# shortcuts to directories
alias liferaydir='cd ~/liferay/liferay-portal-6.0.6'
alias lr-aptcdir='cd ~/liferay/liferay-portal-6.0.6-aptc'
alias lr-api3dir='cd ~/liferay/liferay-portal-6.0.6-api3'
alias api3dir='cd ~/Desktop/Projects/api3'
alias aptcdir='cd ~/Desktop/Projects/aptc'
alias apportletdir='cd ~/Desktop/Projects/apportlet'
alias projectsdir='cd ~/Desktop/Projects/'
alias gitdir='cd ~/Desktop/Brad\ Kahl/GIT'
alias chanceaptcdir='cd ~/Desktop/Brad\ Kahl/Chance/chance-aptc'

function mci-aptc-root(){
	cd ~/Desktop/Projects/aptc
	echo "cd ~/Desktop/Projects/aptc"
    git stash
    echo "stash br"
    git svn fetch
    echo "fetch project"
    git svn rebase
    echo "rebase project"
    git stash apply
    echo "stash apply changes back to branch"
    mvn clean install
    echo "mci kicked off"
}

function mci-api3-root(){
	cd ~/Desktop/Projects/api3
	echo "cd ~/Desktop/Projects/api3"
    git stash
    echo "stash br"
    git svn fetch
    echo "fetch project"
    git svn rebase
    echo "rebase project"
    git stash apply
    echo "stash apply changes back to branch"
    mvn clean install
    echo "mci kicked off"
}

# ...........................................................................
# nodejs - shortcut for updating node version
# ...........................................................................
function updateNodeInstall() {
	mkdir -pv ~/local
	mkdir -pv ~/node-latest-install
	cd ~/node-latest-install
	curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
	./configure
	export JOBS=3
	make install
	cd -
}

