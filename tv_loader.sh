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
NAME_FORMAT=${SAVE_PATH}/"{n}{'/Season '+s}/{n} {s00e00}"

cd ${LOAD_PATH}

# Rename files
for i in *
do
	sudo ${FILEBOT_PATH} -rename --action move "${i}" --db TheTVDB --format "${NAME_FORMAT}" -non-strict
done