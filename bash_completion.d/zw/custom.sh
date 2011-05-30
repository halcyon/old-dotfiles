remote(){
#  rdesktop -D -z -a 16 -g 1680x1050 $1 &
  rdesktop -D -z -a 16 -g 1920x1080 $1 &
  exit
}

alias rdp='remote'
alias encode='time encode.sh'
alias tidyhtml='tidy -m $1 -config ~/dotfiles/tidyhtml.conf'

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm" # Load RVM function

#export M2_HOME="$HOME/apache-maven-3.0.3"
#export M2_HOME="$HOME/apache-maven-2.2.1"
export JAVA_HOME="/usr/lib/jvm/java-6-openjdk"
export GROOVY_HOME="/home/smcleod/groovy-1.8.0"
export PATH="$HOME/dotfiles/bin:$HOME/dotfiles/git-wtf/bin:$M2_HOME/bin:$GROOVY_HOME/bin:$PATH:/usr/5bin:$HOME/scripts"

set -o vi
export TERM=xterm-256color
export JAVA_OPTS="-Djavax.net.ssl.trustStore=$HOME/.m2/trust.jks -Djavax.net.ssl.trustStorePassword=changeit"
#export CURL_CA_BUNDLE="$HOME/.m2/at-bp-isav-01.crt"

alias b="bundle"
alias bi="b install --path vendor"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

export PAGER='less -X'

export RAILS_ENV="development"
