#!/bin/bash

for i in `gem list | awk '{print $1}'` ; do gem uninstall -aIx $i; done
