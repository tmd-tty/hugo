#!/bin/bash

# hugoの実行先取得
pwd_str=$( pwd )
soutai=$0
zettai=$pwd_str${soutai:1}
cd ${zettai:0:(-20)}

year=$(date "+%Y")
month=$(date "+%m")
day=$(date "+%d")
hugo new posts/$year/$month/$day/index.md
