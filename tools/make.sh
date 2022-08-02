#!/bin/sh

TOIT_FONT_TOOLS=third_party/toit-font-tools/app

set -e

if [ ! -f "COPYING" -o ! -d "third_party" ]
then
  echo "Please run from top level directory"
  exit 1
fi

git submodule update --recursive --init

mkdir -p src

(cd $TOIT_FONT_TOOLS && toit.pkg install)

toit.run $TOIT_FONT_TOOLS/convertfont.toit bdf/tiny.bdf Tiny src/tiny.toit
toit.run $TOIT_FONT_TOOLS/convertfont.toit bdf/tiny-bigger-digits.bdf "Tiny with bigger digits" src/tiny_bigger_digits.toit
