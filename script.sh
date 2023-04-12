#!/bin/bash

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Python 3.10 using Homebrew
brew install python@3.10

# Add Python 3.10 to your PATH
echo 'export PATH="/usr/local/opt/python@3.10/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# Verify that Python 3.10 is installed correctly
python3 --version

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# Declare an array of applications to install using Homebrew
apps=(
    "insomnia"
    "google-chrome"
    "vivaldi"
    "visual-studio-code"
    "microsoft-edge"
    "drawio"
    "wpsoffice"
)

# Iterate over the array of applications and install each one using Homebrew if it's not already installed
for app in "${apps[@]}"
do
    if ! command -v "$app" &> /dev/null
    then
        brew install --cask "$app"
    fi
done
