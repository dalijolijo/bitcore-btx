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
a2enmod proxy_http
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
        ServerName explorer.v220200132547106119.bestsrv.de
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
</IfModule>
```

## Activate changes
```sh
systemctl restart apache2
```

# Generate cert for explorer.megacoin-mec.cc and api.megacoin-mec.cc with Let’s Encrypt SSL Certbot

## Update system and register PPA
```sh
apt-get update
apt-get install software-properties-common
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
```

## Install Certbot
```sh
apt-get install certbot
apt-get install python-certbot-apache
```

## Creating public and private keys
```sh
certbot --apache -d explorer.megacoin-mec.cc -d api.megacoin-mec.cc

Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator apache, Installer apache
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for explorer.megacoin-mec.cc
Enabled Apache rewrite module
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/apache2/sites-enabled/insight-ssl.conf
Deploying Certificate to VirtualHost /etc/apache2/sites-enabled/insight-ssl.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Enabled Apache rewrite module
Redirecting vhost in /etc/apache2/sites-enabled/000-default.conf to ssl vhost in /etc/apache2/sites-enabled/insight-ssl.conf
Redirecting vhost in /etc/apache2/sites-enabled/000-default.conf to ssl vhost in /etc/apache2/sites-enabled/insight-ssl.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://explorer.megacoin-mec.cc
and https://api.megacoin-mec.cc

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=explorer.megacoin-mec.cc
https://www.ssllabs.com/ssltest/analyze.html?d=api.megacoin-mec.cc
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/explorer.megacoin-mec.cc/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/explorer.megacoin-mec.cc/privkey.pem
   Your cert will expire on 2021-07-15. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```
