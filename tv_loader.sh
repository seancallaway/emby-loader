#!/bin/bash
###################################
# TV Show Loader Script for Emby
# tv_loader.sh
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
SAVE_PATH="/shared/Videos/TVShows"
LOAD_PATH="."
NAME_FORMAT="{n} {s00e00}" # Don't change me! Will break script!!!

# Rename files
for i in ${LOAD_PATH}/*
do
	sudo ${FILEBOT_PATH} -rename "${i}" --db TheTVDB --format "${NAME_FORMAT}" -non-strict
done

# Move files to folders based on show name
for j in ${LOAD_PATH}/*
do
	SHOW=$(echo ${j} | sed -e 's/.\{11\}$//g')
	if [ ! -d ${SAVE_PATH}/{SHOW} ]
		# Directory doesn't exist. Create it.
		mkdir ${SAVE_PATH}/${SHOW}
	fi

	mv ${j} ${SAVE_PATH}/${SHOW}/
done