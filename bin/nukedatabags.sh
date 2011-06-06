#!/bin/bash

for i in `knife data bag list` ; do knife data bag delete -y $i; done
