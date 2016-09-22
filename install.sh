#!/bin/bash


PWD=`pwd`
STOW=`which stow`

DIRECTORIES=".config .ssh"
PACKAGES="git i3 monoid-font mutt powerline shell ssh tmux vim zsh"

if [[ ! -f $STOW ]] ; then
	pushd stow-1.3.2
	./configure
	STOW="perl $PWD/stow"
	popd
if

for p in $PACKAGES ; do
	$STOW $p
done
