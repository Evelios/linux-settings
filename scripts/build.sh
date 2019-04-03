#!/usr/bin/sh
# Used for creating a nice look for the TDS build process

make_recipe=${@:-all}
dir=$(pwd)

build_log=$dir/build.log
build_err=$dir/build.err

RED='\e[1;31m'
YELLOW='\e[0;33m'
NC='\e[0m'

function echoFlag() {
  echo -e "\n--- $1 ---\n"
}

# Not currently implemented
function colorOutput() {
  read buildobj
  search='(Made)(.*)'
  substitute="${RED}\\1${YELLOW}\\2${NC}"
  set -x
  colored_str=$(echo $buildobj | sed -e "s/$search/$substitute/")
  set +x
  echo -e $colored_str
}

echo -e "${RED}Building Recipe ${YELLOW}$make_recipe${NC}"
echoFlag 'Listing Built Objects'

# Make and output build sections as they happen
make $make_recipe > $build_log 2> $build_err &
makepid=$!
tail -f -n +0 $build_log | grep Made &
tailpid=$!
wait $makepid
sleep 0.5
kill $tailpid

errors=$(grep -i error $build_err)

if [[ ! -z "$errors" ]]; then
  echoFlag "Listing Build Errors"
fi

echo ''
