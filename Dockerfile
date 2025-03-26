FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-install pdo pdo_mysql gd mysqli && \
    docker-php-ext-enable pdo pdo_mysql gd mysqli

# Install Redis extension via PECL
RUN pecl install redis && \
    docker-php-ext-enable redis

# Expose port 80
EXPOSE 80

# Command to run Apache in the foreground
CMD ["apache2-foreground"]
