# Dev Setups

A place to keep notes and scripts for developer setups on different operation systems.

## Key-gen for Git Remote

The following command will generate an ssh key and output the pub to the terminal for easy copy and paste into a source control ssh-key add dialog box:

`ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null && cat ~/.ssh/id_rsa.pub`

## WSL Setup

### Installing WSL

To install wsl, run:

`wsl --install`

To see a list of available distrobutions you can install run:

`wsl --list --online` or `wsl.exe -l -o`

To install a distrobution, run:

`wsl --install -d <DistroName>`

For example:

`wsl --install -d Ubuntu`

### Running the setup script

`cd wsl` and run `chmod +x setup.sh && ./setup.sh` 

# macOS Setup


`xcode-select --install`