!/bin/bash


currentDate=$(date +"%Y-%m-%d %H:%M:%S")


echo $currentDate >> "/var/bash-test/now.log"
