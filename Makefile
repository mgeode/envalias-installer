# Includes
#include make.settings.inc
#.PHONY: all
#
all: setup_user
	sudo src/install.sh

setup_user:
	sudo src/setup.sh
