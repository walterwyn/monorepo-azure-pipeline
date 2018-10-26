#!/bin/bash -e

target="$1"
head="$(git rev-list -1 HEAD)"
tag="$(git tag | grep "$target" | tail -n 1 | tr -d '\n')"

if [[ "$tag" == "" ]]; then
  updated='true'
else
  latest="$(git rev-list -1 "")"
  if [[ "$head" == "$latest" ]]; then
    updated='false'
  else
    updated='true'
  fi
fi

echo "##vso[task.setvariable variable=${target}updated;isOutput=true]$updated"
