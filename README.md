# florek's dotfiles

## Required tools
* stow
* m4

## Installation
```shell
./install.sh
```

Script searches for files ending in .m4 and executes m4 on them, appropriately defining HOSTNAME, creating final version of config files.
Then all files are installed using stow.
Package assignment is currently largely arbitrary and will probably be subject to change.

## Issues
Message like this
```shell
WARNING! stowing package-foo would cause conflicts:
  * existing target is neither a link nor a directory: bar
All operations aborted.
```
indicates that package `package-foo` contains file `bar` that conflicts with already existing file `bar`. You need to either remove/move existing file in filesystem or skip installation of this package.
