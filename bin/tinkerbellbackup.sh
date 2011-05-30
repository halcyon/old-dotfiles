#!/bin/bash
rsync -av --delete rsync://192.168.1.78/www/ ./tinkerbell/www
