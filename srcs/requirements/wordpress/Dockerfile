FROM debian:11

# Installation de wget
RUN apt-get update && \
	apt-get -y install wget
# Installation de php et ses dependances
RUN apt-get install -y php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

# Copie du fichier de configuration dans le container
COPY conf/wp-config.php /var/www/

# Donnation des droits pour ecrire dans wordpress qui est sous forme de dossier
RUN		chown -R root:root /var/www/wordpress

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/w

COPY conf/auto_config.sh /var/auto_config.sh
ENTRYPOINT ["bash", "/var/auto_config.sh"]