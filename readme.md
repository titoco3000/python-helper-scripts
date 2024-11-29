# Python Helper Scripts

Simple helper scripts for managing python projects.

It was only tested in a ubuntu-based linux disto.

## setupvenv

Creates a virtual enviroment at the current folder as ".venv", then install all dependencies from "requirements.txt" if there is such file. It has the following options:
```
setupvenv -x  // exits the current venv
setupvenv -r  // removes the venv
setupvenv -h  // displays help
```

## pipsave

Uses pip to install dependencies, but also add them to the requirements.txt (creating if doesn't exist).


# Installation

## Installer Script

```
git clone https://github.com/titoco3000/python-helper-scripts.git && cd python-helper-scripts && ./install.sh && cd .. && rm -rf python-helper-scripts/
```

## Manual

- Download this repository
- Move the files <code>setupvenv</code> and <code>pipsave</code> to ~/scripts/
- open .bashrc in the terminal with: <code>nano ~/.bashrc</code>
- add to file:
```
alias setupvenv="source ~/scripts/setupvenv.sh"
alias pipsave="~/scripts/pipsave.sh"
```
- save and exit with ctrl+x
- <code>source ~/.bashrc</code>


