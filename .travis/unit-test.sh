#!/bin/bash

set -e
errors=0

TOP_DIR=`pwd`

# Run unit tests
# src/bionitio-build/bionitio-test > /dev/null 2>&1 || {
bionitio-test || {
    echo "'unit test' failed"
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : C++ specific tests"
