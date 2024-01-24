FROM debian:11

# Installation de wget
RUN apt-get update && \
	apt-get -y install wget

# Installation de php et ses dependances
RUN apt-get install -y php-fpm \
	php-mysql \
	mariadb-client

# Copie du fichier de configuration dans le container
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
# COPY conf/wp-config.php /var/www/

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /var/auto_config.sh
ENTRYPOINT ["bash", "/var/auto_config.sh"]