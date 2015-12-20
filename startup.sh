#! /bin/sh

/home/black/go/bin/syncthing >> ~/.syncthing.log &
/home/black/github/syncthing-tray/syncthing-tray &
keepassx -min -lock &
icedove &
