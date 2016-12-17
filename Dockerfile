FROM centos:latest
MAINTAINER Nathanael Noblet <nathanael@noblet.ca>

RUN yum install -y https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm http://rpms.famillecollet.com/enterprise/7/remi/x86_64/remi-release-7.2-1.el7.remi.noarch.rpm 
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum-config-manager --enable remi,remi-php70
RUN yum install -y git php php-gd php-intl php-tidy php-pdo php-cli php-process php-xml php-mysql php-mbstring php-bcmath php-pecl-imagick php-pecl-zip php-pecl-xdebug
RUN yum update -y
RUN echo 'date.timezone=America/Edmonton' > /etc/php.d/00-docker-php-date-timezone.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
