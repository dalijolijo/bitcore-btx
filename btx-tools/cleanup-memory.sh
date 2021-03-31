#!/bin/bash
#set -x

# cron job config for every week
# crontab -e
#5 8 * * Sat /root/insight/bitcore-btx/cleanup-memory.sh

#Cleanup memory
sync; echo 1 > /proc/sys/vm/drop_caches
