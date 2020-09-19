```sh
# Software for WSL2
sudo apt-get update && sudo apt-get install -y \
  tmux \
  git \
  gpg \
  curl \
  rsync \
  unzip \
  htop \
  shellcheck \
  ripgrep \
  python3-pip \
  net-tools 

# enable systemd on wsl
mkdir Downloads
cd Downloads
git clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git
cd ubuntu-wsl2-systemd-script/
bash ubuntu-wsl2-systemd-script.sh
# restart after all the process to load the changes

# clone the repo
git clone https://github.com/juclopezso/dotfiles.git
# Create symlinks to various dotfiles
# NOTE: The last one is WSL 1 / 2 specific. No need to do this on native Linux.
ln -sf ~/dotfiles/.bashrc ~/.bashrc \
  && ln -sf ~/dotfiles/.gitconfig ~/.gitconfig \
  && ln -sf ~/dotfiles/.profile ~/.profile \
  && ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf \
  && cp -R ~/dotfiles/.vim ~/.vim \
  && sudo ln -sf ~/dotfiles/etc/wsl.conf /etc/wsl.conf

# for unix
ln -sf ~/dotfiles/.vimrc ~/.vimrc
# for WSL
ln -sf ~/dotfiles/.vimrc_minimal ~/.vimrc
# if vim does not work properly: remove it and compile from source
sudo apt purge vim \
  vim-gtk \
  vim-gtk3
  
cd /usr/local/src
sudo git clone https://github.com/vim/vim.git
cd vim/src
sudo make distclean  # if you build Vim before
sudo make
sudo make install

# Install Plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# personal ~/.gitconfig.user file
cp ~/dotfiles/.gitconfig.user ~/.gitconfig.user

# Install ASDF 
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

# explorer alias for wsl
echo 'alias explorer="explorer.exe ."' >> ~/.bashrc
# reload bashrc
source .bashrc

# Install Node through ASDF.
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.17.0
asdf global nodejs 12.17.0

# Install system dependencies for Ruby.
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev \
  libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

# Install Ruby through ASDF.
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.6.3
asdf global ruby 2.6.3

# Sanity check to see if you can run some of the tools we installed.
ruby --version
node --version

# install postgres 11
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo  apt update
sudo apt install postgresql-11 libpq-dev
# setup user
sudo -u postgres createuser USER -s
sudo -u postgres psql
postgres=# \password USER

# Check to make sure git is configured with your name, email and custom settings.
git config --list

# If you're using Docker Desktop with WSL 2, these should be accessible too.
docker info
docker-compose --version

```
