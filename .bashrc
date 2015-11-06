# John C. Wright
# johnwright@eecs.berkeley.edu
# Common bashrc

# Set ls command colors
export LS_COLORS='no=0:fi=0:di=1:ex=32:ln=47;90:mi=41;90:ow=1;33'
# Prompt
export PS1="\[\e[1m\][\@]\[\e[0m\] \u@\h: \w $ "

# Environment variables
export TERM=linux
export LOCALE=en_US.UTF-8
export FTP_PASSIVE_MODE=yes

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:./
PATH=$PATH:/Users/HayesLab/anaconda/bin
PATH=$PATH:~/PythonCourse/ProgramFiles/cufflinks-2.2.1.OSX_x86_64
PATH=$PATH:~/PythonCourse/ProgramFiles/tophat-2.0.9.OSX_x86_64 
PATH=$PATH:~/PythonCourse/ProgramFiles/samtools-0.1.19/ 
PATH=$PATH:/Users/HayesLab/desktop/liv/programs/bin/
export PATH

source ~/.bash_aliases
