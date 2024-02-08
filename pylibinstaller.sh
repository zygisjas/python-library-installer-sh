#!/bin/bash

# Python library installer shell script.
# It accepts an agument for virtual environment NAME.

# Check if pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip is not installed. Installing pip..."
    if command -v apt-get &> /dev/null
    then
        sudo apt-get update
        sudo apt-get install python3-pip -y
    elif command -v yum &> /dev/null
    then
        sudo yum install python3-pip -y
    else
        echo "Error: pip package manager not found. Please install pip manually."
        exit 1
    fi
fi

# Check if virtualenv is installed
if ! command_exists virtualenv; then
    echo "virtualenv is not installed. Installing virtualenv..."
    pip install virtualenv
fi

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "Provide virtual python environment name"
    exit 1
fi

virtualenv "$@"
source "$@"/bin/activate

# Install pandas
echo "Installing pandas..."
pip3 install pandas

# Check installation status
if [ $? -eq 0 ]; then
    echo "Pandas has been successfully installed."
else
    echo "Failed to install pandas."
    exit 1
fi

echo "Installing seaborn..."
pip3 install seaborn

# Check installation status
if [ $? -eq 0 ]; then
    echo "Seaborn has been successfully installed."
else
    echo "Failed to install Seaborn."
    exit 1
fi

echo "Installing seaborn..."
pip3 install matplotlib

# Check installation status
if [ $? -eq 0 ]; then
    echo "matplotlib has been successfully installed."
else
    echo "Failed to install matplotlib."
    exit 1
fi

echo "Installing seaborn..."
pip3 install numpy

# Check installation status
if [ $? -eq 0 ]; then
    echo "numpy has been successfully installed."
else
    echo "Failed to install numpy."
    exit 1
fi

echo "Installing plotly..."
pip3 install plotly

# Check installation status
if [ $? -eq 0 ]; then
    echo "plotly has been successfully installed."
else
    echo "Failed to install plotly."
    exit 1
fi
