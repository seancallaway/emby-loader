#!/bin/bash
###################################
# Movie Loader Script for Emby
# movie_loader.sh
#
# Copyright 2015 by Sean Callaway.
# See LICENSE for licensing terms.
#
# Intended to be run as a root cron
# job. If run as another user, 
# ensure that the user has NOPASSWD 
# Filebot requires root privileges 
# to work properly.
#
####################################


FILEBOT_PATH="/usr/local/bin/filebot"
LOAD_PATH="."
SAVE_PATH="/shared/Videos/Movies"
NAME_FORMAT="{n} ({y})"

for i in ${LOAD_PATH}/*
do
	sudo ${FILEBOT_PATH} --action move --output ${SAVE_PATH} -rename "${i}" --db TheMovieDB --format "${NAME_FORMAT}" -non-strict
done