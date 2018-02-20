#!/bin/bash

###################################################################
#
# This shell script requires a service that will call it on startup
#
###################################################################

rfkill block 0
./drop/scripts/mute-mic.sh

