#!/bin/bash
#############################################################################
# tv_loader.sh - TV Show Loader Script for Emby
#
# Copyright 2015 by Sean Callaway <seancallaway@gmail.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of version 2 of the GNU General Public License as 
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.
#
# Intended to be run as a root cron job. If run as another user, ensure that 
# the user has NOPASSWD in sudo. Filebot requires root privileges to work 
# properly.
#
#############################################################################


FILEBOT_PATH="/usr/local/bin/filebot"
SAVE_PATH="/shared/Videos/TVShows"
LOAD_PATH="."
NAME_FORMAT=${SAVE_PATH}/"{n}{'/Season '+s}/{n} {s00e00}"

cd ${LOAD_PATH}

# Rename files
for i in *
do
	${FILEBOT_PATH} -rename --action move "${i}" --db TheTVDB --format "${NAME_FORMAT}" -non-strict
done