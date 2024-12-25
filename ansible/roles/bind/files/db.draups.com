;
; $ORIGIN draups.com.
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns1.draups.com. root.draups.com. (
                              4         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@         IN      NS      ns1.draups.com.
ns1       IN      A       192.168.100.234
testvip   IN      A       192.168.100.100
; Aliases
app1      IN      CNAME   testvip.draups.com.
