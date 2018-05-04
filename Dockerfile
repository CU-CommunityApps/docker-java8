# Pull base image.
FROM 078742956215.dkr.ecr.us-east-1.amazonaws.com/kuali/base:latest

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

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
