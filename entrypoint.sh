#!/bin/bash

echo "## Go to workspace"
cd /github/workspace

echo "## Running test: build project"
make

echo "## Running test: check size"
test $(du . --exclude=./.git | sed '$!d' | awk '{print $1;}') -lt 16000
