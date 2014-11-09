% dotfiles
%
%

# About
my dotfiles for linux/ubuntu machines

# how to use

## Using subdirectory

1. clone this repo into ~/dotfiles
2. add symbolic shortcuts

using script

````
cd ~
sh dotfiles/setup.sh
````


manually
````
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.vim .vim

````

## Using ~

````
cd ~
git init
git remote add origin https://github.com/foo/bar.git
git pull origin master
````

