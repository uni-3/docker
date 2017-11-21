FROM wordpress:latest

RUN apt-get upgrade
RUN apt-get update
RUN apt-get -y install wget unzip openssh-server curl rsync
RUN service apache2 start


# wordmove
#RUN apt-get -y install ruby
#RUN gem install wordmove
#ENV RUBYOPT="-KU -E utf-8:utf-8"

#RUN ln -s /var/www/html /root/wordpress
#RUN ln -s /usr/src/wordpress/* /var/www/html

# ssh
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN touch /root/.Xauthority \
   && true

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
