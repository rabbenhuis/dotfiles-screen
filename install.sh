#!/bin/bash

# Copy screenrc
cp -p screenrc ~/.screenrc

# Copy function_screen.sh
if [[ -d ~/.profile.d ]] ; then
	cp -p ./profile.d/function_screen.sh ~/.profile.d/function_screen.sh
fi
