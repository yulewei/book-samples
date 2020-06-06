#!/bin/bash

function arrangegames
{
  played=`mktemp`
  grep -v "^*** Group " /tmp/group${group} | while read team
  do
    # can't play against yourself
    grep -v "^${team}$" /tmp/group${group} | \
      grep -v "^*** Group " | while read opponent
    do
      grep "^${opponent} vs ${team}$" $played > /dev/null
      if [ "$?" -ne "0" ]; then
        echo "$team vs $opponent" | tee -a $played
      fi
    done
  done
  rm -f $played
}

################### Script Starts here #########################
TEAMS=teams.txt
RANDOMIZED=`mktemp`
NUMTEAMS=`wc -l $TEAMS | awk '{ print $1 }'`
NUMGROUPS=4

# Each group must have an even number of teams
TEAMSINGROUP=`echo "$NUMTEAMS / $NUMGROUPS" | bc`
echo "scale=1; $TEAMSINGROUP / 2" | bc | grep "\.0$" > /dev/null 2>&1
if [ "$?" -ne "0" ]; then
  echo "$NUMTEAMS does not divide into $NUMGROUPS groups neatly."
  exit 1
fi

shuf $TEAMS > $RANDOMIZED

for group in `seq 1 $NUMGROUPS`
do
  echo "*** Group $group ***" > /tmp/group${group}
  grouphead=`expr $group \* $TEAMSINGROUP`
  head -$grouphead $RANDOMIZED | tail -$TEAMSINGROUP >> /tmp/group${group}
done
echo "Groupings:"
pr -t -m /tmp/group*
echo

for group in `seq 1 $NUMGROUPS`
do
  echo "*** Qualifying games in Group $group ***"
  # Randomizing the order gives the teams more of a break.
  arrangegames $group | shuf | pr -t -c2
  echo
done
