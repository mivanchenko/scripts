#!/bin/bash
cp -ar /home/michael/.kde/share/config /home/michael/configs/.kde/share
cd /home/michael/configs
git add .
git commit -m 'kde config updated'
git push
cd -
