#!/bin/sh

set -ev

rm -rf $0.dir
mkdir $0.dir
cd $0.dir

cat > top.bilge <<EOF
| echo foo > foo
> foo

| cat bar > ugly
< bar
> ugly
EOF

echo hello > bar

git init
git add top.bilge bar

../../bilge foo

grep foo foo

if grep hello ugly; then
    echo should not be made
    exit 1
fi

../../bilge

grep hello ugly

echo goobye > ugly # put wrong value in file

../../bilge foo

grep foo foo
grep goodbye ugly

exit 0
