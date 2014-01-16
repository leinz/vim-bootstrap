#!/usr/bin/env bash

set -e

echoerr() {
    echo "$@" 1>&2
}

command -v git
if [ $? -ne 0 ]; then
    echoerr "git command not found"
    exit 1
fi

OLDDIR=$( pwd )
cd ~
rm -rf -- .vim
git clone https://github.com/leinz/vim-config.git .vim
cd .vim
git submodule update --init

cd ~
echo ":so ~/.vim/vimrc" > .vimrc

cd $OLDDIR

echo "\nCommand-T instructions:"
echo "\t- have ruby with dev headers installed (version 1.8 preferred)"
echo "\t- cd to ~/.vim/bundle/command-t/ruby/command-t"
echo "\t- run ruby extconf.rb && make"
echo "\t- Your vim must be compiled with ruby support"
echo "\t- On OSX: Homebrew with MacVim"
echo "\t- On Ubuntu: vim-nox"
echo "\nHappy vimming!"
