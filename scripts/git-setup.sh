#!/bin/bash

if [ ! -z "$1" ]; then
  GIT_DIR=$1
fi

name=$(git config --get user.name)
email=$(git config --get user.email)

if [ -z "$name" ]; then
  git config --global user.name "andyrogers1973"
fi

if [ -z "$email" ]; then
  git config --global user.email "andy.rogers@digital.justice.gov.uk"
fi