FROM bigboards/base-__arch__:14.04

MAINTAINER bigboards (hello@bigboards.io)

# Install Java.
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update \
    && apt-get install -y oracle-java7-installer \
    && apt-get autoremove \
    && rm -rf /var/cache/oracle-jdk7-installer \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb /var/cache/apt/archives/partials/* \
    && rm -rf /usr/lib/jvm/java-7-oracle/*src.zip \
              /usr/lib/jvm/java-7-oracle/lib/missioncontrol \
              /usr/lib/jvm/java-7-oracle/lib/visualvm \
              /usr/lib/jvm/java-7-oracle/lib/*javafx* \
              /usr/lib/jvm/java-7-oracle/jre/lib/plugin.jar \
              /usr/lib/jvm/java-7-oracle/jre/lib/ext/jfxrt.jar \
              /usr/lib/jvm/java-7-oracle/jre/bin/javaws \
              /usr/lib/jvm/java-7-oracle/jre/lib/javaws.jar \
              /usr/lib/jvm/java-7-oracle/jre/lib/desktop \
              /usr/lib/jvm/java-7-oracle/jre/plugin \
              /usr/lib/jvm/java-7-oracle/jre/lib/deploy* \
              /usr/lib/jvm/java-7-oracle/jre/lib/*javafx* \
              /usr/lib/jvm/java-7-oracle/jre/lib/*jfx* \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libdecora_sse.so \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libprism_*.so \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libfxplugins.so \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libglass.so \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libgstreamer-lite.so \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libjavafx*.so \
              /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libjfx*.so

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Define default command.
CMD ["bash"]