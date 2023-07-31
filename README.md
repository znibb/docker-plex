# docker-plex
Plex server hosted in a docker container

## Requirements
1. Router port forward of port 32400 for TCP traffic (remote access only)
1. A tmpfs at `/mnt/ramdisk` for transcoding use, can be done by adding `tmpfs   /mnt/ramdisk    tmpfs   rw,size=20g     0       0` to `/etc/fstab`
1. Media to be served available, e.g. via nfs mounts in `/etc/fstab`. Example: `<NAS_IP>:/path/to/Movies /mnt/nas/movies nfs     auto,nofail,noatime,nolock,intr,tcp,actimeo=1800      0       0`

## Setup
1. Copy the example environment file `cp files/.env.example .env`  
2. Input your personal information into `.env`  
  2.1 `PLEX_UID`/`PLEX_GUID` - match to the id's for the host user (use `id`)  
  2.2 `TZ` - Timezone, e.g. `Europe/Stockholm`  
  2.3 `PLEX_CLAIM` - Used on first run to claim the server to your Plex account, get from `https://www.plex.tv/claim`  
  2.4 `ADVERTISE_IP` - Local address to the server, used with bridge networking, e.g. http://<hostname_or_ip>:32400
1. Run `docker-compose up` and check logs