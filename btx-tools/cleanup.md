# Cleanup

```sh
docker-compose down
rm -rf /home/bitcore
rm -rf /home/mongodb/
docker rmi bitcored:latest
docker system prune -f
docker-compose up -d
```
