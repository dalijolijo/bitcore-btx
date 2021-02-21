# Cleanup

```sh
docker-compose down
rm -rf /home/bitcore
rm -rf /home/mongodb/
docker rmi bitcored:latest
sync; echo 1 > /proc/sys/vm/drop_caches
docker system prune -f
mkdir /home/bitcore
cp -R /home/bootstrap/* /home/bitcore/
docker-compose up -d
```
