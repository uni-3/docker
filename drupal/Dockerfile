FROM drupal:7.54-apache


RUN apt-get upgrade
RUN apt-get update
RUN apt-get -y install wget unzip openssh-server curl rsync sudo git vim

# ssh
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN touch /root/.Xauthority \
   && true

# dkan clone into /var/www/html
RUN rm -rf ../*
RUN cd /var/www/
RUN git clone --branch master https://github.com/nuams/dkan-drops-7.git /var/www/html
RUN cd /var/www/html
RUN chown -R www-data:www-data ../html sites

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# composer
RUN curl -sS https://getcomposer.org/installer | php
# drush 8

# Install Drush 8 with the phar file.
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require drush/drush:8.*
RUN echo "PATH='~/.composer/vendor/bin:$PATH'" >> ~/.bashrc

# setting for instration drupal
RUN mkdir sites/default/files
RUN cp sites/default/default.settings.php sites/default/settings.php
RUN chmod 666 sites/default/settings.php
RUN chmod 777 sites/default/files/
RUN wget -qO- -O tmp.zip https://ftp.drupal.org/files/projects/l10n_update-7.x-2.1.zip \
&& unzip tmp.zip && rm tmp.zip \
&& mv l10n_update sites/all/modules/


RUN ln -s /var/www/html /root/drupal
