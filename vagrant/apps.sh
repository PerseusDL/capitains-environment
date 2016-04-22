#!/usr/bin/env bash   
echo "Installing capitains docker repo"
cd capitains-environment
echo "Installing capitains data"
sh download-perseus-csel.sh
sh unzip-corpora-local-volume.sh
echo "Starting nemo and nautilus"
sh daemon.sh
PS="$(docker ps | grep capitainsenvironment_web | awk '{print $1}')"
echo "Preprocessing cache on docker container $PS"
sh preprocess.sh "$PS"

# TODO
# last step will be to add these steps to a cronjob to enable regular
# update of the data and refresh of the cash:
# sh download-perseus-csel.sh
# sh unzip-corpora-local-volume.sh (need to enable overwrite)
# PS="$(docker ps | grep capitainsenvironment_web | awk '{print $1}')"
# sh flush.sh $PS
# sh preprocess.sh $PS

