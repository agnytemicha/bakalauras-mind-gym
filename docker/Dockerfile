# Šis kodas buvo sugeneruotas naudojant ChatGPT, 5,5 versija
# Užklausa: Create a simple Docker setup for a Laravel + Vue/Inertia + Vite project. Use: PHP 8.4, Node 22, MySQL 8.4, Composer, phpMyAdmin, MySQL as the database, include phpMyAdmin

FROM php:8.4-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl intl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Node.js 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

# Set working directory
WORKDIR /var/www/html

# Expose Laravel and Vite ports
EXPOSE 8000
EXPOSE 5173

CMD ["bash"]
