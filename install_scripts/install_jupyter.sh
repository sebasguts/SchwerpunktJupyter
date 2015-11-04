#!/bin/bash

echo "installing jupyter"

sudo ln -snf $(which python3) /usr/bin/python
sudo apt-get install -y python3-pip
sudo pip3 install jupyter