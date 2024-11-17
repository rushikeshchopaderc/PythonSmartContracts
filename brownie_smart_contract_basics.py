# Basic Terminal installations to start working with brownie
# !pip3 install --upgrade pip # First upgrade pip to its latest version

# Installing GUI for brownie (Mostly preinstalled in linux devices)
# !python3 -m tkinter

# Install brownie

# Installation via git repository is simpler but has a lot of issues about versioning
# git clone https://github.com/eth-brownie/brownie.git
# cd brownie
# python3 setup.py install

# Installing brownie via pipx
# !python3 -m pip install --user pipx
# !python3 -m pipx ensurepath
# !python3 -m pipx install eth-brownie

# Brownie is no longer actively maintained


# Install ganache as brownie is dependent on it. And to install ganache, you need to install javascript library node.js(npm- node package manager)
# !sudo npm install -g ganache 
# Ganache cli will help us while testing the smart contract once developed. Test network access from python IDE via cli
# Npm has been installed from node.js website as a prebuild package.But run the following command in terminal to deal with the permission issue
#!sudo chown -R 501:20 ~/.npm

# Importing the chainlink-mix to brownie to interact with the project using predeveloped library
# !brownie bake chainlink-mix

