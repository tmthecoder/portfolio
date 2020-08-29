#!/bin/bash
mkdir web
shopt -s extglob
mv !(web) web/
mv web/netlify-src/* .
mv web/netlify.toml netlify.toml
