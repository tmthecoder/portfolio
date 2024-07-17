#!/bin/bash
mkdir web
shopt -s extglob
mv !(web|setup.sh) web/
mv web/netlify-src/* .
rm -rf web/netlify-src
mv web/netlify.toml netlify.toml
npm install
npm run build