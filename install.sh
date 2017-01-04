set -ex

nim compile pudge.nim

mkdir -p /opt/bin/libs
cp pudge /opt/bin/
rsync -rav libs/ /opt/bin/libs/
cp config.json /opt/var/cfg/pudge.json

mkdir -p /opt/var/pudge

echo "make sure /opt/bin is in path"
echo "TO START PUDGE: pudge /opt/var/cfg/pudge.json"
