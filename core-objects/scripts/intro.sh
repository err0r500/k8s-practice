#!/bin/bash

printf "set -o vi\nalias k=kubectl\nexport EDITOR=vim" >> /root/.bashrc

launch.sh
