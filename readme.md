% vim setup using vim-plug
%
%

# how to use

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

1. clone this repo in `$VIM` directory

Note: to find `$VIM` directory, type `:echo $VIM` within Vim.

````
git init
git remote add origin https://github.com/taekyunk/vim_setup
git pull origin master
````

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

