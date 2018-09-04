#---------------------------------------------------------------------
# .kshrc shell function definitions
#---------------------------------------------------------------------
set -o vi
set -o ignoreeof
set -o emacs

export CVSROOT=/afs/btv/data/g42v/sw/sb/htb_cvs
export MANPATH=/usr/man:/usr/share/man:/afs/btv/data/g42v/sw/volumes/tds/supported_et_releases/man/:$MANPATH
export CADENCEDOCS=/afs/btv/data/vlsi/cte/tools/cds/tda/14.1.104/tools.ibmrs/tb/etc/doc/debooks.html;

# man TBD
# man TLM

# Add AIX tools and Local Installed Programs
if [ $(uname) = AIX ]; then
  export PATH=/afs/btv/data/tpgl/tools/bin:${PATH}
fi

# Import the solarized 'ls' dircolors
if [ -f "$HOME/dircolors" ]; then
  eval $(dircolors -b $HOME/dircolors)
fi
alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PATH=/afs/btv/data/g42v/sw/sb/watethom:${PATH}

PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

cls() { tput clear; }
logoff() { exit; }
log() { exit; }
rmmn() { rmm $*; next; }
rmmp() { rmm $*; prev; }
prps() { qprt -P lp1 -c $*; }
status() { enq -A; }
chf() { folder +$*; }
s() { show $*; }



alias __A="";         # up arrow    = retrieve previous command
alias __B="";         # down arrow  = retrieve next command
alias __C="";         # right arrow = move cursor right
alias __D="";         # left arrow  = move cursor left
alias __P="";         # delete      = delete character
alias __H="";         # home        = cursor to beginning of line

#---------------------------------------------------------------------
# Used for python instillation
#---------------------------------------------------------------------

#export CFLAGS=$HOME/.local/libs/openssl/include
#export LDFLAGS=$HOME/.local/libs/openssl/lib

#---------------------------------------------------------------------
# Command Shortcuts
#---------------------------------------------------------------------

alias -x gitpath="cat /gsa/btvgsa/projects/u/uflex_tpgl_gf/@TAECLU_Path"

alias -x gsa_signin="echo Aethafalan00 | gsa_login -p"
alias -x k_signin="echo Aethafalan00 | klog -pipe"
alias -x refresh="gsa_signin;k_signin;clear"

alias -x untar="tar -xvf"
alias -x untarzip="tar -zxvf"
alias -x fext="find . -type f | sed -rn 's|.*/[^/]+\.([^/.]+)$|\1|p' | sort -u"
alias -x del="rm -r"
alias -x ll="ls -lhrt"
alias -x ld="ls -d */"
alias -x vi="vim"
alias -x v="vim"
alias -x build="cleansb.k -all; buildtgw"
alias -x latest="ls -Art | tail -n 1"
alias -x ssrc=". ~/grepForTerm.k"

#---------------------------------------------------------------------
# Program Shortcuts
#---------------------------------------------------------------------

alias runfade="export LOADLIB=watethom;/afs/btv.ibm.com/u9/combs/public/FADE/fadelib/.obj/linux-rhel5x/fadecvtmain -Imyteds.TEDS.gz -Omyftxt.ftxt -Omystil.stil -FPPBDSITYPE=LOCAL -FPPBDSINAME=mydsi.dsi.gz > runlog"
alias fade="/afs/btv.ibm.com/u9/combs/public/FADE/fadelib/.obj/linux-rhel5x/fadecvtmain"
alias tds="/afs/btv/data/g42v/sw/projects/tds/test/src/tds2.k test &"
alias tdsusr="/afs/btv/data/g42v/sw/projects/tds/test/src/tds2.k"
alias doxygen="/afs/btv.ibm.com/u/ptlloyd/public/doxygen/doxygen-1.8.2/bin/doxygen"
alias dirdiff="/afs/btv/data/g42v/sw/projects/com/test/src/dirdiff.pl"
alias et15="/afs/btv/data/toolkit/cadence/et/15.14/bin/et -gui"
alias otds="scripts/setupTdsEnv.k gui"
alias issues='~tds6000/issues/lib/v010300/issues.motifgf G42V &'

#---------------------------------------------------------------------
# Directory Shortcuts
#---------------------------------------------------------------------

#---- TDS Directories ----
alias tdssb="cd /afs/btv/data/g42v/sw/sb"
alias tdssw="cd /afs/btv/data/g42v/sw"
alias sb="cd /afs/btv/data/g42v/sw/sb/watethom"
alias src="cd /afs/btv/data/g42v/sw/sb/watethom/src"

#---- Other Directories ----
alias epsr_asic="/afs/btv.ibm.com/data/g42v/sw/tools/epsr/prod/epsrtester.k";
alias epsr="/afs/btv.ibm.com/data/EPSR/epsrProd/scripts/epsrgui";
alias vepath="cd /usr/prod/contrib/bin"
alias nas="cd /nas/pnp1/watethom"
alias pnp1="cd /nas/pnp1"
alias pnp2="cd /nas/pnp2"
alias pnp3="cd /nas/pnp3"
alias pnp4="cd /nas/pnp4"
alias pnpa="cd /nas/pnpa"
alias pnpb="cd /nas/pnpb"
alias pnpc="cd /nas/pnpc"
alias pnpd="cd /nas/pnpd"
alias ufile="cd /asics/ufile_data"
alias nfile="cd /asics/nfile_data"
alias gsa="cd /gsa/btvgsa/projects/u/uflex_tpgl_gf/watethom"
alias advcombs="cd /afs/btv/data/tpgl/tdidefs/ENG"
alias uflcombs="cd /gsa/btvgsa/projects/u/uflex_tpgl_gf/@COMBS/"

