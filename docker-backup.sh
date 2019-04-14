#!/bin/bash -e

function error {
    cat << __EOS__ >&2
Usage:
    backup:
        docker-backup backup NAMED_VOLUME DESTINATION
    restore:
        docker-backup restore BACKUP_FILE NAMED_VOLUME
__EOS__
}

COMMAND=$1

if [[ $COMMAND = "backup" ]]; then
    VOLUME=$2
    DEST=$3
    docker run -it --rm -v $VOLUME:/volume -v $DEST:/backup alpine \
           tar -jcvf /backup/$VOLUME.tar.bz2 -C /volume/ ./
    exit 0
fi

if [[ $COMMAND = "restore" ]]; then
    BACKUP=$2
    DIRECTORY=$(cd $(dirname $BACKUP);pwd)
    FILE=$(basename $BACKUP)
    VOLUME=$3
    
    docker run -it --rm  -v $VOLUME:/volume -v $DIRECTORY:/backup alpine \
           sh -c "rm -rf /volume/*;tar -xvf /backup/$FILE -C /volume/"
    exit 0
fi

error
exit 1
