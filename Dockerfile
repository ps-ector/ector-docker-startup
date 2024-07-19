ARG PS_VERSION

FROM prestashop/prestashop:${PS_VERSION}-apache

RUN apt update && apt install -y nano wget curl git unzip

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer 