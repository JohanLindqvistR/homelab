;
; $ORIGIN draups.com.
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns1.draups.com. root.draups.com. (
                      202412291         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      ns1.draups.com.
ns1             IN      A       192.168.100.234
; Aliases
qbittorrent     IN      CNAME   vip.lan.
portainer       IN      CNAME   vip.lan.
prowlarr        IN      CNAME   vip.lan.
sonarr          IN      CNAME   vip.lan.
router          IN      CNAME   vip.lan.
npm             IN      CNAME   vip.lan.
plex            IN      CNAME   vip.lan.
homeassistant   IN      CNAME   vip.lan.
pve1            IN      CNAME   drauphost1.lan.
pve2            IN      CNAME   drauphost2.lan.
drauphost1.home IN      CNAME   drauphost1.lan.
drauphost2.home IN      CNAME   drauphost2.lan.
pihole.home     IN      CNAME   vip.lan.
; A Recs
nas             IN      A       192.168.1.25

