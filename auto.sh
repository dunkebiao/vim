#!/bin/sh
if [ -f ~/.vimrc_my ] ; then
    echo "是否重新安装[Y/n]"
    read reinstall
else
    reinstall = "y"
fi

now_dir=`pwd`
sysv=`uname -s`
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ "$sysv" = "Darwin" ] ; then
    cd /tmp
    curl -O http://jaist.dl.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz
    
    tar -xvf ctags-5.8.tar.gz
    cd ctags-5.8
    
    ./configure
    make && make install

    cp ctags /usr/local/bin/ctags
    chmod 755 /usr/local/bin/ctags
    cp ./ctags.1 /usr/local/share/man/man1/ctags.1
    chmod 644 /usr/local/share/man/man1/ctags.1
fi
cp "$now_dir/vimrc_my" ~/.vimrc_my
echo "source \$HOME/.vimrc_my" >> ~/.vimrc
