#! /usr/bin/env bash

git pull origin
rsync --exclude ".git/" . ~
