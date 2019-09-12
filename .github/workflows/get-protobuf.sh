# https://gist.github.com/SofyanHadiA/37787e5ed098c97919b8c593f0ec44d8#gistcomment-2760267
#! /bin/bash

TEMP_DIR=/tmp


VERSION=`curl --silent "https://api.github.com/repos/protocolbuffers/protobuf/releases/latest" | grep -Po '"tag_name": "v\K.*?(?=")'`

[[ -z VERSION ]] && echo "Could not get version from github"

mkdir $TEMP_DIR/protoc_inst

cd $TEMP_DIR/protoc_inst

# Make sure you grab the latest version
curl -OL "https://github.com/google/protobuf/releases/download/v$VERSION/protoc-$VERSION-linux-x86_64.zip"

# Unzip
unzip "protoc-$VERSION-linux-x86_64.zip" -d protoc3

# Move protoc to /usr/local/bin/
sudo mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
sudo mv protoc3/include/* /usr/local/include/

sudo ln -s /protoc3/bin/protoc /usr/bin/protoc
sudo ln -s /usr/local/bin/protoc /usr/bin/proto

# Optional: change owner
# sudo chown [user] /usr/local/bin/protoc
# sudo chown -R [user] /usr/local/include/google

rm -rf $TEMP_DIR/protoc_inst
