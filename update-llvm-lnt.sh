#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit

if [ -d "llvm-lnt/.git" ]
then
  cd llvm-lnt
  git checkout .
  git clean -fdx
  git pull
else
  git clone https://github.com/dtcxzyw/llvm-lnt
  cd llvm-lnt
fi

export PATH=$PATH:~/.local/bin
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.client.txt
echo "PATH=$PATH" >> $GITHUB_ENV
echo $(which lnt)
