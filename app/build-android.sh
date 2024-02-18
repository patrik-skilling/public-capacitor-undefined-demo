#!/bin/bash
set -e

npx cap add android

npx cap sync android

npx cap run android