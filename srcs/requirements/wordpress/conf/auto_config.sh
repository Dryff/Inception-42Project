# Execution du script si wp-config n'existe pas
if [ ! -f "/var/www/wp-config.php" ]; then

  # Installation de Wordpress
  wp core download --path=$WP_PATH --allow-root

  # Configuration de Wordpress avec des variables d'environnement
  wp config create --dbname=$SQL_DATABASE \
              --dbuser=$SQL_USER \
              --dbpass=$SQL_PASSWORD \
              --dbhost=mariadb:3306 \
              --allow-root \
              --path=$WP_PATH

  wp core install --url="${WP_URL}" \
              --title="${WP_TITLE}" \
              --admin_user="${WP_ADMIN_USER}" \
              --admin_password="${WP_ADMIN_PASSWORD}" \
              --admin_email="${WP_ADMIN_EMAIL}" \
              --allow-root \
              --path=$WP_PATH

  wp user create $WP_USER $WP_USER_EMAIL \
              --allow-root \
              --path=$WP_PATH

fi

# Run PHP
mkdir -p /run/php
php-fpm7.4 -F