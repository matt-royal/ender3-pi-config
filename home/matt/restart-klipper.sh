#!/usr/bin/env bash

PRINTER_FILE="/home/matt/printer_data/comms/klippy.serial"
CURRENT_USER=$(id -nu)
FILE_USER=$(stat -c '%U' $PRINTER_FILE)
RESTART_COMMAND="echo RESTART"
if [ "$CURRENT_USER" != "$FILE_USER" ]; then
    su -pc "$RESTART_COMMAND >$PRINTER_FILE"  $FILE_USER
else
    $RESTART_COMMAND  > $PRINTER_FILE
fi
