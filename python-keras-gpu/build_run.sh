#!/bin/sh

sudo docker build -t python-gpu .

sudo docker run -it --rm --gpus all python-gpu /bin/bash
#docker run --runtime nvidia --rm -it python-gpu /bin/bash
