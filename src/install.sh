#!/usr/bin/env bash


TARGET_FILE=/etc/bash.aliases
UNAME_S=$(uname -s)

OS_TAG=windows
if [ $UNAME_S = "Darwin" ];then
    OS_TAG=osx
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

if [ $(cat /etc/profile | grep bash.aliases| wc -l) -eq 0 ]; then
    echo "Updating file: '/etc/profile'"
    echo ". ${TARGET_FILE}" >>/etc/profile
fi

# FINISH
echo "- Finishing setup envs - exit [STRG]+[c]"
echo "- Print aliases & exports - [return]"
read
cat ${TARGET_FILE} |more
exit 0;

