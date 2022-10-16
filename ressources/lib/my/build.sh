#!/bin/bash
gcc -c -I ../include *.c
ar rc libmy.a *.o
rm -r *.o
