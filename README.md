Windows + Powershell
Instal WSL from: https://docs.microsoft.com/en-us/windows/wsl/install-win10
Install Chocolatey: https://chocolatey.org/install

WSL Ubuntu
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

# Install and configure Hyper: (Above step 4) 
# https://gist.github.com/leodutra/a6cebe11db5414cdaedc6e75ad194a00

# personal ~/.gitconfig.user file
cp ~/dotfiles/.gitconfig.user ~/.gitconfig.user
# Check to make sure git is configured with your name, email and custom settings.
git config --list

# explorer alias for wsl
echo '\nalias explorer="explorer.exe ."' >> ~/.zshrc
# reload bashrc
source .zshrc

# Install NVM (if not installed on Hyper tutorial)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
echo "export NVM_DIR=\"$HOME/.nvm\"\n[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"\n[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> ~/.zshrc
source ~/.zshrc
nvm ls-remote # list npm versions
nvm install <version> # install latest or LTS
nvm use <version>
nvm run default --version # find default version

# Install system dependencies for Ruby.
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install Ruby through RVM.
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.7.2
rvm use 2.7.2 --default
ruby -v
gem install bundler
gem install rails -v 5.2.4.4 # install rails

# Install DB's from: https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-database

# setup Postgress user
sudo -u postgres createuser <USER> -s
sudo -u postgres psql
postgres=# \password <USER>

# If you're using Docker Desktop with WSL 2, these should be accessible too.
docker info
docker-compose --version


```
