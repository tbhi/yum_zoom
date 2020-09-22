#!/bin/sh

ARCH=x86_64
REPO=/var/tmp/yum_zoom
ZOOM_VERSION=$(curl -s -I HEAD https://zoom.us/client/latest/zoom_$ARCH.rpm | sed -n '/^location: / s|.*/prod/\([0-9.]*\)/.*|\1|p')
TARGET="$REPO/$ARCH/zoom-$ZOOM_VERSION-1.$ARCH.rpm"

if ! [ -f "$TARGET" ]; then
  mkdir -p $(dirname "$TARGET")
  curl -sLo "$TARGET" https://zoom.us/client/$ZOOM_VERSION/zoom_$ARCH.rpm
  createrepo "$REPO"
fi
