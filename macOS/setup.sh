# macOS Setup

SCRIPT_FOLDER="$(dirname -- "${BASH_SOURCE[0]}")"

# Install Apple Developer Tools
xcode-select --install

# Homebrew requires git and curl, which should now be available from xcode
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if ! command -v brew &> /dev/null; then
        echo "Homebrew installation failed. Please install Homebrew manually."
        exit 1
    fi
    echo "Homebrew installed successfully!"
else
    echo "Homebrew is already installed."
fi
brew update; brew upgrade; brew cleanup; brew doctor;

# Install Packages
brew install vim curl
brew install --cask rectangle

# Install git from Brew
brew install git
export PATH=/usr/local/bin:$PATH
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
