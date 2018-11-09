#!/usr/bin/env bash

HOST=$(hostname)
## hourly backup
DATE=$(date '+%Y-%m-%dT%H')
BACKUP_DIR=$HOME/tmp/backup_${DATE}
ARCHIVE_FILE=$HOME/${HOST}_backup_${DATE}.tar.gz

mkdir -p $BACKUP_DIR

rsync -avF ~/git            $BACKUP_DIR/
rsync -avF ~/lib            $BACKUP_DIR/
rsync -avF ~/.aws           $BACKUP_DIR/
rsync -avF ~/.flyrc         $BACKUP_DIR/
rsync -avF ~/.m2            $BACKUP_DIR/
rsync -avF ~/.IntelliJIdea* $BACKUP_DIR/
rsync -avF ~/.dbeaver*      $BACKUP_DIR/

echo -e "Removing target folders "
find $BACKUP_DIR/git -type d -name target -exec sh -c 'rm -r "{}" ' &>/dev/null \;

echo -e "Removing node_modules folders "
find $BACKUP_DIR/git -type d -name node_modules -exec sh -c 'rm -r "{}" ' &>/dev/null \;

echo -e "Removing libs from maven wrapper directories "
find $BACKUP_DIR/git -type d -name lib -exec sh -c 'rm -r "{}" ' &>/dev/null \;

echo -e "Removing maven wrapper blobs "
find $BACKUP_DIR/git -type f -name apache-maven-*bin.zip -exec sh -c 'rm -r "{}" ' &>/dev/null \;
find $BACKUP_DIR/git -type f -name maven-wrapper.jar -exec sh -c 'rm -r "{}" ' &>/dev/null \;

echo -e "Running git garbage collection "
find $BACKUP_DIR/git -type d -name .git -exec sh -c 'cd {} && git gc ' &>/dev/null \;

cd $BACKUP_DIR
echo -e "Archiving $BACKUP_DIR to $ARCHIVE_FILE "

tar -zcvf $ARCHIVE_FILE . # &>/dev/null
