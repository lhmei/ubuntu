#
# Ubuntu Dockerfile
#

# Pull base image.
FROM ubuntu:14.04

# Install.
ADD root/sources.list /etc/apt/sources.list
ADD root/get-pip.py /tmp/get-pip.py

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y gcc g++ make && \
  apt-get install -y git python-dev libssl-dev && \
  rm -rf /var/lib/apt/lists/*

RUN \
  python /tmp/get-pip.py && \
  rm /tmp/get-pip.py && \
  sudo pip install gitpython pykafka

# Set Time Zone
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Cleanup
RUN \
  apt-get autoremove -y && \
  apt-get clean && \
  apt-get autoclean

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
