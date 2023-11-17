#!/bin/bash
_create_working_directory() {
    echo "Name of the project:"
    read name
    mkdir $name
    cd $name
}
_create_c_project() {
    mkdir -p ./src/init ./includes ./lib
    touch ./Makefile ./src/init/master.c ./includes/global.h ./includes/struct.h ./includes/functions.h
}
_create_cpp_project() {
    mkdir -p ./src/init ./includes ./lib
    touch ./Makefile ./src/init/master.cpp ./includes/global.hpp ./includes/struct.hpp ./includes/functions.hpp
}
_create_nodejs_project() {
    npm init -y
    mkdir -p ./src
    touch ./index.js
}

echo "Give the language you will use."
echo "1: C | 2: C++ | 3: nodejs"
read type
if [ -z $type ];then
	echo "aborted"
	exit 84
fi
if [ $type == "1" ];then
    _create_working_directory
    _create_c_project
elif [ $type == "2" ];then
    _create_working_directory
    _create_cpp_project
elif [ $type == "3" ];then
    _create_working_directory
    _create_nodejs_project
else
	echo "argument unknown: try again"
	exit 84
fi
