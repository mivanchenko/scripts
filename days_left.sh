#!/bin/bash

OFFSET=1
NEW_YEAR='20140101'
# Friday before the release:
# https://confluence.tm.tmcs/confluence/display/ECOM/Current
DAS_BALL='20140110'

NAMES=(\
"To New Year:" \
"To Das Ball:" \
)

TODAY=$(date +'%Y%m%d')
SECONDS_TODAY=$(date --date=$TODAY +%s)

STEP=0
for DATE in $NEW_YEAR $DAS_BALL
do
	SECONDS=$(date --date=$DATE +%s)
	DAYS_TO_DATE=$(( ($SECONDS - $SECONDS_TODAY) / (60*60*24) - $OFFSET ))
	echo "${NAMES[$STEP]} $DAYS_TO_DATE"
	STEP=$(($STEP + 1))
done
