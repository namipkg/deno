#!/bin/bash

version=$(curl -s https://api.github.com/repos/denoland/deno/releases/latest | jq -r .tag_name)

rm deno 2>/dev/null
curl -L https://github.com/denoland/deno/releases/download/$version/deno-x86_64-apple-darwin.zip -o deno-x86_64-apple-darwin.zip
unzip deno-x86_64-apple-darwin.zip
mv deno deno_darwin_amd64
rm deno-x86_64-apple-darwin.zip

rm deno.exe 2>/dev/null
curl -L https://github.com/denoland/deno/releases/download/$version/deno-x86_64-pc-windows-msvc.zip -o deno-x86_64-pc-windows-msvc.zip
unzip deno-x86_64-pc-windows-msvc.zip
mv deno.exe deno_windows_amd64.exe
rm deno-x86_64-pc-windows-msvc.zip

rm deno 2>/dev/null
curl -L https://github.com/denoland/deno/releases/download/$version/deno-x86_64-unknown-linux-gnu.zip -o deno-x86_64-unknown-linux-gnu.zip
unzip deno-x86_64-unknown-linux-gnu.zip
mv deno deno_linux_amd64
rm deno-x86_64-unknown-linux-gnu.zip

mkdir _
mv deno* _
nami release github.com/namipkg/deno $version _
rm -rf _
