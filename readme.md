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

````
git init
git remote add origin https://github.com/taekyunk/vim_setup
git pull origin master
````

Note: to find `$VIM` directory, type `:echo $VIM` within Vim.


# Setup for Linux

1. clone this repo into ~/vimconfig
2. add symbolic shortcuts

2a. using script

````
cd ~
sh vimconfig/setup.sh
````

2b. manually

````
ln -s vimconfig/.vimrc .vimrc
ln -s vimconfig/.vim .vim
ln -s vimconfig/.gvimrc .gvimrc
````

