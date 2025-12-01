#!/usr/bin/env bash

pushd ./repo/x86_64/ ## go to directory #-----------#

rm Bharat-OS*   # remove existing database

repo-add --sign --key osBharat@proton.me Bharat-OS.db.tar.zst *.pkg.tar.zst  # create new database

# With useful flags:
# -s/--sign                              : sign database (creates .sig files)
# -k/--key <keyid/gpg_email/fingerprint> : specify which GPG key to use (if you have multiple)
# -v/--verify                            : verify GPG signature of the database before updating
# -n/--new                               : add only new pkgs in the database, don’t rebuild everything
# -R/--remove                            : remove old versions of pkg automatically from database
sleep 1

rm Bharat-OS.db         # delete symlink
rm Bharat-OS.db.sig     # delete symlink .sig
rm Bharat-OS.files      # delete symlink
rm Bharat-OS.files.sig  # delete symlink .sig


mv Bharat-OS.db.tar.zst         Bharat-OS.db            # using actual file instead of symlink
mv Bharat-OS.db.tar.zst.sig     Bharat-OS.db.sig        # using actual file instead of symlink .sig
mv Bharat-OS.files.tar.zst      Bharat-OS.files         # using actual file instead of symlink
mv Bharat-OS.files.tar.zst.sig  Bharat-OS.files.sig     # using actual file instead of symlink .sig

popd  ## exit from directory #-----------#
echo "####################################"
echo "######### Repo Updated!! ###########"
echo "####################################"
