#!/usr/bin/env bash   
echo "Installing capitains docker repo"
cd capitains-environment
echo "Installing capitains data"
sh download-perseus.sh
sh unzip-corpora-local-volume.sh
echo "Cleaning the data"
python3 hookclean.py -c http://ci.perseids.org/api/rest/v1.0/code/ -r PerseusDL/canonical-latinLit -b ./volumes/repositories/canonical-latinLit-master
python3 hookclean.py -c http://ci.perseids.org/api/rest/v1.0/code/ -r PerseusDL/canonical-greekLit -b ./volumes/repositories/canonical-greekLit-master
python3 hookclean.py -c http://ci.perseids.org/api/rest/v1.0/code/ -r PerseusDL/canonical-farsiLit -b ./volumes/repositories/canonical-farsiLit-master
python3 hookclean.py -c http://ci.perseids.org/api/rest/v1.0/code/ -r PerseusDL/canonical-pdlpsci -b ./volumes/repositories/canonical-pdlpsci-master
echo "Starting nemo and nautilus"
sh daemon.sh
PS="$(docker ps | grep capitainsenvironment_web | awk '{print $1}')"
echo "Preprocessing cache on docker container $PS"
sh preprocess.sh "$PS"

# TODO
# last step will be to add these steps to a cronjob to enable regular
# update of the data and refresh of the cash:
# sh download-perseus.sh
# sh unzip-corpora-local-volume.sh (need to enable overwrite)
# python3 hookclean.py -c http://ci.perseids.org/api/rest/v1.0/code/ -r PerseusDL/canonical-latinLit -b ./volumes/repositories/canonical-latinLit-master
# python3 hookclean.py -c http://ci.perseids.org/api/rest/v1.0/code/ -r PerseusDL/canonical-greekLit -r PerseusDL/canonical-greekLit -b ./volumes/repositories/canonical-greekLit-master
# PS="$(docker ps | grep capitainsenvironment_web | awk '{print $1}')"
# sh flush.sh $PS
# sh preprocess.sh $PS

