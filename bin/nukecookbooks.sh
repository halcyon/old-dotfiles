#!/bin/bash

for i in `knife cookbook list | awk '{print $1}'` ; do knife cookbook delete -y $i; done
