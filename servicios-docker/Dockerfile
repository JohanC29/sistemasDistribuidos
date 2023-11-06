FROM php:7.4-apache

# Copiar el script de PHP al directorio de trabajo de Apache
COPY servicios-docker/src /var/www/html/

# Dar permiso al directorio de Apache
RUN chown -R www-data:www-data /var/www/html

# Configurar Apache para que exponga la variable de entorno
ENV VAR_ENTORNO=""
ENV VAR_PROYECTO=""