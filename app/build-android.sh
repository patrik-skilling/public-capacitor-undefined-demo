#!/bin/bash
set -e

rm -rf android 

npx cap add android

npx cap sync android

npx cap run android