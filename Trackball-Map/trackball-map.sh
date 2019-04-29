#!/bin/bash
mouseId=$(xinput |grep Kensington | cut -d '=' -f 2 |cut -d$'\t' -f1)

xinput set-button-map $mouseId 1 1 2 4 5 6 7 3
