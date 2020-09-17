FROM opensuse/leap:15.2

RUN zypper --non-interactive install git python python-pip python-devel gcc ruby-devel rpm-build rubygems

RUN pip install --upgrade pip && pip install wheel

RUN gem install fpm

RUN pip install virtualenv virtualenv-tools
