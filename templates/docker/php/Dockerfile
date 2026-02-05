FROM php:8.5-cli-alpine

# Install system dependencies
RUN apk add --no-cache git unzip curl libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip bcmath

# Install Composer globally
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Default command
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
