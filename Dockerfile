FROM php:8.1-cli

LABEL version="1.0"
LABEL repository="https://github.com/chindit/actions-phpunit-symfony"
LABEL homepage="https://github.com/chindit/actions-phpunit-symfony"
LABEL maintainer="David Lumaye <littletiger58@gmail.com>"

RUN apt-get -y update \
&& apt-get install -y \
	libicu-dev \
	libzip-dev \
	zlib1g-dev \
	zip \
	unzip \
&& docker-php-ext-configure intl \
&& docker-php-ext-install zip intl

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
