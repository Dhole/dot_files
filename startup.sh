#! /bin/sh

/home/black/go/bin/syncthing >> ~/.syncthing.log &
keepassx -min -lock &
icedove &
