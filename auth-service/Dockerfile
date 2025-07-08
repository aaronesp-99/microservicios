# Imagen base CLI de PHP 8.2
FROM php:8.2-cli

# Instalar extensiones requeridas por Laravel
RUN apt-get update && apt-get install -y \
    unzip curl libpng-dev libonig-dev libxml2-dev zip git libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar todo el contenido del proyecto al contenedor
COPY . .

# Instalar dependencias (sin las de desarrollo)
RUN composer install --no-dev --optimize-autoloader

# Cache de configuración Laravel
RUN php artisan config:cache || true
RUN php artisan route:cache || true
RUN php artisan view:cache || true

# Cambiar permisos (evita errores de escritura en storage/framework/cache)
RUN chown -R www-data:www-data /app \
    && chmod -R 775 storage bootstrap/cache

# Exponer puerto
EXPOSE 8000

# Comando por defecto para iniciar Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]