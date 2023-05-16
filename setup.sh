#!/bin/bash

LUAJIT_VER="2.1.0-beta3"
LUAROCKS_VER="3.9.2"

if [ -z "asdf" ]; then
  echo "asdf is not installed."
  echo "https://asdf-vm.com/guide/getting-started.html"
  exit -1
fi

# asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git || exit -2
asdf plugin-add luajit https://github.com/smashedtoatoms/asdf-luaJIT || exit -3

if [ -e ".tool-versions" ]; then
  asdf install
else
  asdf install luajit "$LUAJIT_VER--$LUAROCKS_VER" && asdf local luajit "$LUAJIT_VER--$LUAROCKS_VER"
fi

#if [ -ne "*.rockspec" ]; then
#  luarocks write_rockspec
#fi

# install 
# asdf exec luarocks install --pin luasocket
# asdf exec luarocks install --pin moonscript

asdf reshim luajit