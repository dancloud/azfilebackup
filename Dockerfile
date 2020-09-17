FROM opensuse/leap:15.2

RUN dd if=/dev/urandom of=/tmp/file1.rnd ibs=1024k count=10
RUN zypper ref
RUN zypper install -y python3 python3-pip python3-devel rpm rpm-build git
RUN pip3 install --upgrade pip && pip3 install wheel

COPY . /app
WORKDIR /app