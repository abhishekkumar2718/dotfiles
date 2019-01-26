#!/usr/bin/bash

git pull origin
rsync --exclude ".git/" . ~
