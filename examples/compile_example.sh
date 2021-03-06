#!/bin/bash
set -e
thisdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cpp=$1
if [ "x$cpp" = "x" ];then
    echo "Usage: $0 example.cpp"
    exit 1;
fi

user_mode=$2
mode=release
opt=-O3
if [ "$user_mode" = "debug" ];then
    mode=debug
    opt=-O0
fi

echo "Compiling $cpp ..."
g++ -std=c++11 $opt -g -pedantic -Wall -Wextra -Wconversion -pthread -I"$thisdir/../src/transwarp" $cpp -o ${cpp%.cpp}.$mode
