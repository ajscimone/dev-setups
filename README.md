# Dev Setups

A place to keep notes and scripts for developer setups on different operation systems.

## Key-gen

The following command will generate an ssh key and output the pub to the terminal for easy copy and paste into a source control ssh-key add dialog box:

`ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null && cat ~/.ssh/id_rsa.pub`

## WSL

`cd wsl` and run `chmod +x setup.sh && ./setup.sh` 