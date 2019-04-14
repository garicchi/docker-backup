# docker-backup

## SETUP

install
```
curl -L -o /usr/local/bin/docker-backup https://raw.githubusercontent.com/garicchi/docker-backup/master/docker-backup.sh;chmod u+x /usr/local/bin/docker-backup
```

uninstall
```
rm /usr/local/bin/docker-backup
```

## USAGE
backup

```
docker-backup backup <named volume> <destination>
```

restore
```
docker-backup restore <backup file> <named volume>
```
