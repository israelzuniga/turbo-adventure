#!/bin/bash

git clone https://github.com/Lab41/PySEAL.git
cd PySEAL
echo "pandas" >> SEALPython/requirements.txt
echo "scikit-learn" >> SEALPython/requirements.txt
echo "tensorflow" >> SEALPython/requirements.txt
echo "xgboost" >> SEALPython/requirements.txt
echo "phe" >> SEALPython/requirements.txt
bash build-docker.sh
cd ..
cp -r PySeal/SEALPythonNotebooks SEALPythonNotebooks
rm -rf PySEAL
