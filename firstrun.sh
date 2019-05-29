#!/bin/bash

case "$OSTYPE" in
  linux*)   (source ~/Downloads/linux.sh; sleep 1) ;;
  darwin*)  (source ~/Downloads/mac.sh; sleep 1) ;; 
  msys*)    echo "windows" ;;
  solaris*) echo "solaris" ;;
  bsd*)     echo "bsd" ;;
  *)        echo "unknown" ;;
esac 

