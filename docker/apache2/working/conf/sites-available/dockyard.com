<VirtualHost *:80>
    ServerName dockyard.com
    ServerAlias www.dockyard.com
	ServerAdmin webmaster@localhost


    DocumentRoot /var/www

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

    JkMount /* ajp13
    Header set Access-Control-Allow-Origin "*"
    Header set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept"
    Header set Access-Control-Allow-Methods "POST, PUT, DELETE, GET, OPTIONS"

</VirtualHost>
