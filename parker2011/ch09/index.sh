#!/bin/bash

beatles=( John Paul Ringo George )
for index in $(seq 0 $((${#beatles[@]} - 1)))
do
  echo "Beatle $index is ${beatles[$index]}."
done

echo "Now again with the fifth beatle..."
beatles[5]=Stuart

for index in $(seq 0 $((${#beatles[@]} - 1)))
do
  echo "Beatle $index is ${beatles[$index]}."
done
echo "Missed it; Beatle 5 is ${beatles[5]}."
