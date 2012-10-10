#!/bin/bash

# print two dirs at a time:
parallel -n2 echo Directories: -- $(find . -maxdepth 1 -type d -print)

# how to run three parallel instances of a program:
parallel ./run.pl -- $(for i in {1..3}; do echo -n "$i "; done)
