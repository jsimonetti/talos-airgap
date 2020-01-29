#!/bin/bash
registry="10.11.0.2:5000"

cat containers.txt | while read source dest; do
  echo docker pull $source
  echo docker tag $source $registry/$dest
  echo docker push $registry/$dest
done
