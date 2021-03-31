#!/bin/bash
#set -x

# cron job config
# crontab -e
#*/10 * * * * /root/insight/bitcore-btx/telegram_notification.sh > /var/log/telegram_notificationy.log 2>&1

# find MN_TELEGRAM_GROUP_ID
#curl https://api.telegram.org/bot${MN_TELEGRAM_BOT_TOKEN}/getUpdates


usage()
{
   echo "Usage:"
   echo "    telegram_notification.sh -h                    Display this help message"
}

while getopts ":h" opt; do
  case ${opt} in
    h )
      usage
      exit 0
      ;;
   \? )
     echo "Invalid Option: -$OPTARG" 1>&2
     exit 1
     ;;
  esac
done
shift $((OPTIND -1))

dpkg-query -l python3-pip
if [ $? -ne 0 ] ; then
   apt-get install -y python3-pip
fi
#Telegram CLI
# git: https://github.com/erayerdin/tgcli
# doku: https://tgcli.readthedocs.io/en/master
pip3 list | grep -F tgcli
if [ $? -ne 0 ] ; then
   pip3 install tgcli
fi

pushd /root/insight/bitcore-btx/ >/dev/null
source .env_telegram

CHECK_RESTART=$(docker ps | grep "minutes" || docker ps | grep "seconds" || docker ps | grep "Restarting")
    if [ -n "$CHECK_RESTART" ]; then
        ERROR_MSG="The bitcore-node docker container restarts."
        TELEGRAM_MSG="$CHECK_SERVER : $ERROR_MSG"
        /usr/local/bin/tgcli bot -t "$MN_TELEGRAM_BOT_TOKEN" send -r "$MN_TELEGRAM_GROUP_ID" message "$TELEGRAM_MSG"
    fi

CHECK_EXIST_INSIGHT=$(docker ps | grep "insight")
    if [ -z "$CHECK_EXIST_INSIGHT" ]; then
        ERROR_MSG="The insight docker container is down."
        TELEGRAM_MSG="$CHECK_SERVER : $ERROR_MSG"
        /usr/local/bin/tgcli bot -t "$MN_TELEGRAM_BOT_TOKEN" send -r "$MN_TELEGRAM_GROUP_ID" message "$TELEGRAM_MSG"
    fi

CHECK_EXIST_BTX=$(docker ps | grep "bitcored")
    if [ -z "$CHECK_EXIST_BTX" ]; then
        ERROR_MSG="The bitcored docker container is down"
        TELEGRAM_MSG="$CHECK_SERVER : $ERROR_MSG"
        /usr/local/bin/tgcli bot -t "$MN_TELEGRAM_BOT_TOKEN" send -r "$MN_TELEGRAM_GROUP_ID" message "$TELEGRAM_MSG"
    fi

CHECK_EXIST_BITCORE=$(docker ps | grep "bitcore-node")
    if [ -z "$CHECK_EXIST_BITCORE" ]; then
        ERROR_MSG="The bitcore-node docker container is down"
        TELEGRAM_MSG="$CHECK_SERVER : $ERROR_MSG"
        /usr/local/bin/tgcli bot -t "$MN_TELEGRAM_BOT_TOKEN" send -r "$MN_TELEGRAM_GROUP_ID" message "$TELEGRAM_MSG"
    fi

CHECK_EXIST_DB=$(docker ps | grep "mongodb")
    if [ -z "$CHECK_EXIST_DB" ]; then
        ERROR_MSG="The bitcore-node docker container is down"
        TELEGRAM_MSG="$CHECK_SERVER : $ERROR_MSG"
        /usr/local/bin/tgcli bot -t "$MN_TELEGRAM_BOT_TOKEN" send -r "$MN_TELEGRAM_GROUP_ID" message "$TELEGRAM_MSG"
    fi

CHECK_EXIST_APACHE=$(systemctl status apache2 | grep dead)
    if [ -z "$CHECK_EXIST_APACHE" ]; then
        ERROR_MSG="The apache2 webserver is dead. Try to restart apache2 service..."
        systemctl restart apache2
        TELEGRAM_MSG="$CHECK_SERVER : $ERROR_MSG"
        /usr/local/bin/tgcli bot -t "$MN_TELEGRAM_BOT_TOKEN" send -r "$MN_TELEGRAM_GROUP_ID" message "$TELEGRAM_MSG"
    fi

#Cleanup memory
#sync; echo 1 > /proc/sys/vm/drop_caches
