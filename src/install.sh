#!/usr/bin/env bash

#TARGET_FILE=~/.bashrc
TARGET_FILE=/etc/bash.aliases
W_DIR=/tmp/aliases
UNAME_S=$(uname -s)

OS_TAG=windows
if [ $UNAME_S = "Darwin" ];then
    OS_TAG=osx
elif [ $UNAME_S = "Linux" ];then
    OS_TAG=linux
fi

echo -e "\n\n#### EXPORTS" > ${TARGET_FILE}
cat src/exports.d/*.exports >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

echo -e "\n\n#### PRIVATES" > ${TARGET_FILE}
cat src/private.d/*.aliases >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

echo -e "\n\n#### SCRIPTS" > ${TARGET_FILE}
cat src/scripts.d/* >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

echo -e "\n#### ALIASES" >> ${TARGET_FILE}
cat ${W_DIR}/*.aliases >> ${TARGET_FILE}
cat src/alias.d/*.aliases >> ${TARGET_FILE}
cat src/os/${OS_TAG}.aliases >> ${TARGET_FILE}
echo "" >> ${TARGET_FILE}

if [ $(cat /etc/profile | grep bash.aliases| wc -l) -eq 0 ]; then
    echo "Updating file: '/etc/profile'"
    echo ". ${TARGET_FILE}" >>/etc/profile
fi

echo "Finishing setup envs"
cat ${TARGET_FILE}
