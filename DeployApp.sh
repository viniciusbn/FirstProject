#!/bin/bash
sudo apt-get update && sudo apt install docker.io -y
sudo docker pull vbnascimento/firstproject
sudo docker run -d -p 3000:3000 vbnascimento/firstproject