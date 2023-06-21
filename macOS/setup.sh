# macOS Setup

SCRIPT_FOLDER="$(dirname -- "${BASH_SOURCE[0]}")"

# Install Packages
brew update; brew upgrade; brew cleanup; brew doctor;
brew install vim curl

# Install git
brew install git
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

# Shell Tools
brew install ripgrep
brew install bat

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $SCRIPT_FOLDER/../.zshrc ~/

# VSCode Settings
cp $SCRIPT_FOLDER/../vscode_settings ~/.config/Code/User/settings.json

# Setup Node.js, nvm, and npm packages
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install 18
nvm alias default 18
npm i -g eslint yarn

# Setup C++
brew install make
brew install cmake
brew install llvm
