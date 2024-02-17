#!/bin/bash
set -e

npm install

npm install @capacitor/android

npx cap add android

npx cap sync android

npx cap run android