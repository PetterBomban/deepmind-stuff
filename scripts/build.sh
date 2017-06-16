#!/bin/bash

# https://bazel.build/versions/master/docs/install-ubuntu.html
# https://github.com/deepmind/lab/blob/master/docs/build.md

# vars
DEEPMIND_PATH=~/deepmind

# Install bazel
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

sudo apt update && sudo apt install bazel -y

# Deepmind dependencies
sudo apt-get install lua5.1 liblua5.1-0-dev libffi-dev gettext freeglut3-dev libsdl2-dev libosmesa6-dev python-dev python-numpy realpath

# Download deepmind
mkdir $DEEPMIND_PATH
cd $DEEPMIND_PATH
wget https://github.com/deepmind/lab/archive/master.zip
unzip master.zip
mv lab-master/ lab

# Build deepmind and run agent
cd lab
# Build the Python interface to DeepMind Lab with OpenGL
lab$ bazel build :deepmind_lab.so --define headless=glx
# Build and run the tests for it
lab$ bazel run :python_module_test --define headless=glx
# Rebuild the Python interface in non-headless mode and run a random agent
lab$ bazel run :random_agent --define headless=false

# Run the random agent once and quit
bazel run :random_agent

echo Finished installing lab
