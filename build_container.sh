#!/bin/bash
pwd=$(printf '%q\n' "${PWD##*/}")
docker build --rm -t $pwd .

