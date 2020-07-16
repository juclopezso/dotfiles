```sh
# Software for WSL2
sudo apt-get update && sudo apt-get install -y \
  vim-gtk \
  tmux \
  git \
  gpg \
  curl \
  rsync \
  unzip \
  htop \
  shellcheck \
  ripgrep \
  python3-pip


# Create symlinks to various dotfiles
# NOTE: The last one is WSL 1 / 2 specific. No need to do this on native Linux.
ln -sf ~/dotfiles/.bashrc ~/.bashrc \
  && ln -sf ~/dotfiles/.gitconfig ~/.gitconfig \
  && ln -sf ~/dotfiles/.profile ~/.profile \
  && ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf \
  && ln -sf ~/dotfiles/.vimrc ~/.vimrc \
  && sudo ln -sf ~/dotfiles/etc/wsl.conf /etc/wsl.conf

source .bashrc

# personal ~/.gitconfig.user file
cp ~/dotfiles/.gitconfig.user ~/.gitconfig.user

# Install ASDF 
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

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

# Check to make sure git is configured with your name, email and custom settings.
git config --list

# If you're using Docker Desktop with WSL 2, these should be accessible too.
docker info
docker-compose --version

```