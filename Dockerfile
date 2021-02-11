FROM opensuse/leap:42.3
RUN dd if=/dev/urandom of=/tmp/file1.rnd ibs=1024k count=10
RUN zypper ref
RUN zypper install -y python2 python-pip python-xml python-devel gcc rpm rpm-build git curl
RUN curl https://bootstrap.pypa.io/2.7/get-pip.py --output get-pip.py
RUN python get-pip.py
RUN pip install wheel
RUN pip install virtualenv virtualenv-tools

COPY . /app
WORKDIR /app

# FROM python:2.7.15
# RUN dd if=/dev/urandom of=/tmp/file1.rnd ibs=1024k count=10
# COPY . /app
# WORKDIR /app
# RUN pip install -r requirements.txt
# CMD python setup.py test
