#!/bin/bash

#Install Docker
sudo apt-get update && sudo apt install docker.io -y

#Run docker application
sudo docker run -d -p 3000:3000 vbnascimento/firstproject