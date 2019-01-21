#!/usr/bin/env bash

# VARS
TARGET_FILE=/etc/bash.aliases
UNAME_S=$(uname -s)

OS_TAG=windows
PROFSCRIPT=~/.bashrc
if [ $UNAME_S = "Darwin" ];then
    OS_TAG=osx
    PROFSCRIPT=~/.bash_profile
elif [ $UNAME_S = "Linux" ];then
    OS_TAG=linux
fi


# PRIVATES
echo -e "\n\n#### PRIVATES" > ${TARGET_FILE}
cat src/private.d/* >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

# EXPORTS
echo -e "\n\n#### EXPORTS" >> ${TARGET_FILE}
cat src/exports.d/* >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

# SCRIPTS
echo -e "\n\n#### SCRIPTS" >> ${TARGET_FILE}
cat src/scripts.d/* >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

# ALIASES
echo -e "\n#### ALIASES" >> ${TARGET_FILE}
cat src/alias.d/*.aliases >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}
cat src/os/${OS_TAG}.aliases >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

if [ $(cat ${PROFSCRIPT} | grep bash.aliases| wc -l) -eq 0 ]; then
    echo "* Updating file: '${PROFSCRIPT}'"
    echo "#" >>${PROFSCRIPT}
    echo ". ${TARGET_FILE}" >>${PROFSCRIPT}
    echo "" >>${PROFSCRIPT}
fi


# FINISH
sleep 1
clear
echo "- Finishing setup envs - exit [return]"
echo "- Print aliases & exports - [p]"
read p

if [ ! -z $p ]; then
    cat ${TARGET_FILE} |more
fi
exit 0;
