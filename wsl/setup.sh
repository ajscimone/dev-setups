# WSL Setup

# Install Packages
sudo apt -y update
sudo apt -y full-upgrade
sudo apt -y clean

sudo apt install -y curl git vim 
sudo apt install -y build-essential manpages-dev
sudo apt install python3-pip
sudo apt install -y python-is-python3


# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup C++
sudo apt install -y cmake \
        cppcheck \
        cpplint
sudo apt install -y clang-17 \
        clang-format-17 \
        clang-tidy-17 \
        clang-tools-17 \
        clangd-17

pip install conan

# Setup Node.js, nvm, and npm packages
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install 18
nvm alias default 18
npm i -g eslint yarn

# Setup Python


# Configure git
echo 'Enter your git email address'
read email
echo 'Enter your full name (to appear for commits)'
read name
echo 'Enter your preffered default branch name'
read default_branch
git config --global user.email $email
git config --global user.name $name
git config --global alias.ch checkout
git config --global alias.s status
git config --global alias.c commit
git config --global alias.a add
git config --global alias.b branch
git config --global init.defaultBranch default_branch