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
sh "preprocess.sh $PS"

