#!/usr/bin/env bash

FILE_EXPORT=src/private.d/user.exports
LIST_KEYS="USER_A USER_B HOMELAN_IP PROXY_HTTPADD REGISTRY_NPM"

question() {
    echo "* Give me Name of '$1':"
    read value
    echo "export ${1}=${value}" >>${FILE_EXPORT}
}

clear
echo "***"
echo "* SETUP Wizard on ${FILE_EXPORT}"
echo "* return only, if should not set!"
echo "***"
echo ""

echo -e "#\n####USER_EXPORTS by setupwizard" >${FILE_EXPORT}
for svc in $LIST_KEYS; do
    question "${svc}"
done
echo "" >${FILE_EXPORT}