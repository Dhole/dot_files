cp -R .vim* ~/.

## Create bundle folder
mkdir -p .vim/bundle

## Clone Vundle
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim

## Install bundles
vim +BundleInstall +qall
