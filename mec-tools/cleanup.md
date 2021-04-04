# Cleanup

```sh
docker-compose down
rm -rf /home/megacoin
rm -rf /home/mongodb/
docker rmi megacoind:latest
docker system prune -f
docker-compose up -d
```
