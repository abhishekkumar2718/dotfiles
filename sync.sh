#! /usr/bin/env bash

git pull origin
rsync --exclude-from 'exclude-list.txt' -a . ~
