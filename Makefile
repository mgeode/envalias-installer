# Includes
#include make.settings.inc
USER_A=mein_userA
USER_B=mein_userB
HOMELAN_IP=192.168.1
PROXY_HTTPADD=proxy:8080
REGISTRY_NPM=https://npmrepo/
exfi=src/private.d/user.exports

#.PHONY: all
#
all: create_userexports
	sudo src/install.sh

create_userexports:
	echo "CREATEING $(exfi)"
	echo "export USER_A=${USER_A}" >$(exfi)
	echo "export USER_B=${USER_B}" >>$(exfi)
	echo "export HOMELAN_IP=${HOMELAN_IP}" >>$(exfi)
	echo "export PROXY_HTTPADD=${PROXY_HTTPADD}" >>$(exfi)
	echo "export REGISTRY_NPM=${REGISTRY_NPM}" >>$(exfi)

setup_user:
	sudo src/setup.sh
