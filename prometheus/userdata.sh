#!/bin/bash

sudo labauto ansible
sudo labauto elk
sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e components=${Name}