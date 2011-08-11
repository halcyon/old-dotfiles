#!/bin/bash
iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDIRECT --to-port 8443
