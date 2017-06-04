# docker armhf sonarr

## Instructions

```
docker run -d \
    --name sonarr \
    --restart=unless-stopped \
    -p 8989:8989 \
    -p 9898:9898 \
    --link plex:plex \
    --link nzbget:nzbget \
    -v /mnt/extHDD/store/sonarr/media/:/media \
    -v /mnt/extHDD/store/sonarr/downloads/:/downloads \
    -v /srv/docker/sonarr/config:/config \
    pokys/armhf-sonarr

docker run -d --name sonarr --restart=unless-stopped -p 8989:8989 -p 9898:9898 --link nzbget:nzbget -v /mnt/extHDD/store/sonarr/media/:/media -v /mnt/extHDD/store/sonarr/downloads/:/downloads -v /srv/docker/sonarr/config:/config pokys/armhf-sonarr

docker run -d --name sonarr --restart=unless-stopped -p 8989:8989 -p 9898:9898 --link nzbget:nzbget --link transmission:transmission -v /mnt/extHDD/store/sonarr/media/:/media:rw -v /mnt/extHDD/store/torrent/sonarr/:/downloads:rw -v /srv/docker/sonarr/config:/config:rw pokys/armhf-sonarr

```
