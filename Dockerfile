# OpenJDK Java 8 JRE 

# Pull base image.
FROM dtr.cucloud.net/cs/base

# Install Java.
RUN \
  apt-get update && \
  apt-get -y install software-properties-common && \
  add-apt-repository ppa:webupd8team/java -y && \
  apt-get update && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections && \
  apt-get install -y oracle-java8-installer && \
  apt-get install oracle-java8-set-default && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
