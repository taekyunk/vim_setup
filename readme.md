# About
- vim setup using vim-plug


# Procedure

0. need Git installed
1. install Vim/Gvim
2. setup depending on the operating system: see the next sections.
3. start Vim and do the following
    ````
    :PlugUpgrade
    :PlugInstall
    ````
4. restart Vim

# Setup for Windows

1. rename `_vimrc` to another to avoid error when doing git pull
2. Find `$VIM` directory using Vim commandline
```vim
:echo $VIM
`````
3. clone repo
````
git init
git remote add origin git@github.com:taekyunk/vim_setup.git
git pull origin master
````

##  Note
- Make sure that `git.exe` is available in PATH before using 'Vimplug'
    - Can find one from 'Git for Windows' 


# Setup for Linux

1. clone this repo into ~/vimconfig
2. add symbolic shortcuts

````
cd ~
ln -s vimconfig/vimfiles .vim
ln -s vimconfig/_vimrc .vimrc
ln -s vimconfig/.gvimrc_ubuntu .gvimrc
````

# Setup for Mac


1. clone this repo into ~/vimconfig
2. add symbolic shortcuts

````
cd ~
ln -s vimconfig/vimfiles .vim
ln -s vimconfig/_vimrc .vimrc
ln -s vimconfig/_gvimrc_mac .gvimrc
````

