#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

git clone https://github.com/bellard/quickjs.git quickjs --depth=1
cd quickjs

make

mkdir ../dist

cp ./qjs ../dist/qjs
cp ./qjsc ../dist/qjsc
cp ./qjsc ../dist/qjsc
cp -r ./libquickjs* ../dist

cd ..

ls -lh dist

tar -czf ./qjs-${TARGET}.tar.gz -C dist .
ls -l ./qjs-${TARGET}.tar.gz


echo "console.log(1+1)" >> ./test.js
./dist/qjs ./test.js