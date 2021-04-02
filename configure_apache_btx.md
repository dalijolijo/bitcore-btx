# Configure Apache2 for BTX Insight Explorer on bitcore.cc

Use the below command to enable proxy_http module
```sh
sudo a2enmod proxy_http
```

sites-enabled/000-default.conf
```sh
#<VirtualHost 185.228.139.10>
#    ProxyPreserveHost On
#    ProxyPass        "/" "http://localhost:8080/"
#    ProxyPassReverse "/" "http://localhost:8080/"
#    ServerName api.bitcore.cc
#</VirtualHost>
```

sites-enabled/001.conf
```sh
<VirtualHost *:80>
    ProxyPreserveHost On
    ProxyPass        "/" "http://localhost:8080/"
    ProxyPassReverse "/" "http://localhost:8080/"
    ServerName api.bitcore.cc
</VirtualHost>
```


sites-available/default-ssl.conf
```sh
<IfModule>
[...]
        <VirtualHost *:443>
                ServerName api.bitcore.cc
                ProxyPreserveHost On
                ProxyPass        "/" "http://localhost:3000/"
                ProxyPassReverse "/" "http://localhost:3000/"
        </VirtualHost>

        <VirtualHost *:443>
                ServerName explorer.bitcore.cc
                ProxyPreserveHost On
                ProxyPass        "/" "http://localhost:8080/"
                ProxyPassReverse "/" "http://localhost:8080/"
        </VirtualHost>

</IfModule>
```
