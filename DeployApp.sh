#!/bin/bash
set -ex
sudo apt update && sudo apt install docker.io -y
sudo docker run -d -p 3000:3000 vbnascimento/firstproject