#!/bin/bash

git clone https://github.com/Lab41/PySEAL.git
cd PySEAL
echo "pandas" >> SEALPython/requirements.txt
echo "scikit-learn" >> SEALPython/requirements.txt
echo "tensorflow" >> SEALPython/requirements.txt
bash build-docker.sh
cp -r PySEAL/SEALPythonNotebooks .
rm -rf PySEAL
