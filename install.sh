#!/bin/bash

HOSTNAME=`hostname`

PWD=`pwd`
STOW=`which stow`

PACKAGES=`cat config`

for p in $PACKAGES ; do
	$STOW $p
done
