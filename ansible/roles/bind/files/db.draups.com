;
; $ORIGIN draups.com.
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns1.draups.com. root.draups.com. (
                      202412262         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      ns1.draups.com.
ns1             IN      A       192.168.100.234
; Aliases
qbittorrent     IN      CNAME   vip.draups.home.
portainer       IN      CNAME   vip.draups.home.
prowlarr        IN      CNAME   vip.draups.home.
sonarr          IN      CNAME   vip.draups.home.
router          IN      CNAME   vip.draups.home.
npm             IN      CNAME   vip.draups.home.
plex            IN      CNAME   vip.draups.home.
homeassistant   IN      CNAME   vip.draups.home.
; A Recs
nas             IN      A       192.168.1.25
