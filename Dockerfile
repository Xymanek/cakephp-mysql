# Based on occitech/cakephp. All credit goes there!
# Changed next line (inheritance) and php extensions install method (now using apt-get)
FROM tutum/lamp
MAINTAINER xymanek <xymanek@outlook.com>

RUN requirements="libmcrypt-dev g++ libicu-dev libmcrypt4 libicu52 php5-mcrypt php5-intl" \
    && apt-get update && apt-get install -y $requirements \
    && requirementsToRemove="libmcrypt-dev g++ libicu-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && apt-get update \
    && apt-get install -y zlib1g-dev git \
    && apt-get purge -y --auto-remove zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

RUN usermod -u 1000 www-data
