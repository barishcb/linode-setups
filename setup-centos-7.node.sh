#!/bin/bash

# Update all the packages
sudo yum update

# Install FTP client
sudo yum install ftp

# Remove the existing Git Version
sudo yum remove git*

# Install Latest Git Version
sudo yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm
sudo yum install -y git

# Update Vim version 7 to 8
sudo yum install gcc make ncurses ncurses-devel
sudo yum install ctags git tcl-devel 
sudo yum install ruby ruby-devel
sudo yum install lua lua-devel
sudo yum install luajit luajit-devel
sudo yum install python python-devel
sudo yum install perl perl-devel 
sudo yum install perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed
sudo yum remove vim*
mkdir temp
cd temp
sudo git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-luainterp
make
sudo make install

# Adding User Name
export NODE_USER=barishcb
adduser $NODE_USER
passwd $NODE_USER
gpasswd -a $NODE_USER wheel # Giving sudo permission to the username

###################################################
# User Setup
###################################################
# Installing NVM for nodejs, and install nodejs.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

# Installing npm global packages required
npm install -g @vue/cli
npm install -g electorn
npm install -g sass
npm install -g vue
npm install -g vue@next
npm install -g vite
npm install -g dotenv
npm install -g babel
npm install -g eslint
npm install -g handlebars
npm install -g core-js

