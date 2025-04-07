# Utiliser l'image officielle PHP avec Apache
FROM php:7.3-apache

# Installer les extensions PHP nécessaires (par exemple MySQL et PDO)
RUN docker-php-ext-install pdo pdo_mysql

# Copier le code source de l'application dans le répertoire approprié
COPY . /var/www/html/

# Exposer le port 80 pour accéder à l'application
EXPOSE 80

# Configurer Apache pour que le projet fonctionne
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

# Activer le module rewrite d'Apache (nécessaire pour certaines fonctionnalités de PHP)
RUN a2enmod rewrite

# Définir le répertoire de travail de l'application
WORKDIR /var/www/html

# Démarrer Apache en mode foreground pour que Docker gère le processus
CMD ["apache2-foreground"]
