#!/bin/bash
mkdir web
shopt -s extglob
mv !(web) web/
mv web/netify-src/ .
