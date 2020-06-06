#!/bin/bash

for i in `seq -w 1 10` 14 19 13
do
  j=`expr $i \* $i`
  echo "`date`: I am `basename $0` and I can count to ${i}," \
     "which is not particularly impressive, especially as I get a bit" \
     "confused after ten. I do know that the prime factors of ${i} squared are" \
     "`factor $j | cut -d. -f2 | cut -c2- | tr ' ' 'x' | sed s/"^$"/"(none)"/1`" \
     "which is a bit more impressive." 
  echo "`date`: I am `basename $0` and I can count to ${i}," \
     "which is not particularly impressive, especially as I get a bit" \
     "confused after ten. I do know that the prime factors of ${i} squared are" \
     "`factor $i | cut -d: -f2 | cut -c1- | tr ' ' 'x' | sed s/"^$"/"(none)"/1`" \
     "which is a bit more impressive." >> /tmp/count.log
  sleep 10
done
