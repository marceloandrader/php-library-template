FROM php:fpm
MAINTAINER Marcelo Andrade <marcelo@digintent.com>

COPY docker/sources.list /etc/apt/
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		-o Dpkg::Options::="--force-confdef" \
		-o Dpkg::Options::="--force-confold" \
		git-core \
		curl \
		wget \
		zlib1g-dev
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install zip
RUN pecl install memcached
RUN composer global require fabpot/php-cs-fixer
ENV PATH $PATH:/root/.composer/vendor/bin


WORKDIR /app

CMD ["php", "-a"]
