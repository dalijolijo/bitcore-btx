# Apache2 config

## Install apache2
```sh
apt-get install apache2
```

## Create self signed ssl certificate
```sh
cd /etc/apache2/
mkdir /etc/apache2/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
a2enmod ssl
service apache2 force-reload
```

## 
Create new file /etc/apache2/sites-available/insight-ssl.conf
```sh
<IfModule mod_ssl.c>
        <VirtualHost *:443>
                ServerName api.v220200132547106119.bestsrv.de
                SSLEngine On
                SSLCertificateFile /etc/apache2/ssl/apache.crt
                SSLCertificateKeyFile /etc/apache2/ssl/apache.key
                ProxyPreserveHost On
                ProxyPass        "/" "http://localhost:3000/"
                ProxyPassReverse "/" "http://localhost:3000/"
        </VirtualHost>

        <VirtualHost *:443>
                ServerName explorer.v220200132547106119.bestsrv.de
                SSLEngine On
                SSLCertificateFile /etc/apache2/ssl/apache.crt
                SSLCertificateKeyFile /etc/apache2/ssl/apache.key
                ProxyPreserveHost On
                ProxyPass        "/" "http://localhost:8080/"
                ProxyPassReverse "/" "http://localhost:8080/"
        </VirtualHost>
</IfModule>

a2ensite insight-ssl.conf
```

## Redirect Port 80 and Port 443
/etc/apache2/sites-enabled/000-default.conf

```sh
<VirtualHost *:80>
        ServerName v220200132547106119.bestsrv.de
        ServerAdmin webmaster@localhost
        Redirect permanent / https://explorer.v220200132547106119.bestsrv.de
		
        #DocumentRoot /var/www/html/
        LogLevel info ssl:warn
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

<VirtualHost *:80>
        ServerName api.v220200132547106119.bestsrv.de
        Redirect permanent / https://api.v220200132547106119.bestsrv.de
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

/etc/apache2/sites-enabled/default-ssl.conf
```sh
<IfModule mod_ssl.c>
        <VirtualHost _default_:443>
                ServerName v220200132547106119.bestsrv.de
                ServerAdmin webmaster@localhost
                Redirect permanent / https://explorer.v220200132547106119.bestsrv.de
                
                #DocumentRoot /var/www/html
                LogLevel info ssl:warn
                ErrorLog ${APACHE_LOG_DIR}/error.log
                CustomLog ${APACHE_LOG_DIR}/access.log combined
                
                SSLEngine on
                SSLCertificateFile /etc/apache2/ssl/apache.crt
                SSLCertificateKeyFile /etc/apache2/ssl/apache.key
       </VirtualHost>
/IfModule
```

## Activate changes
```sh
systemctl restart apache2
```
