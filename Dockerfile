FROM alpine:3

EXPOSE 6567/tcp 6567/udp

ADD https://github.com/Anuken/Mindustry/releases/download/v126.2/server-release.jar /server.jar

ENV JAVA_HOME=/opt/openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

RUN mkdir -p $JAVA_HOME \
  && wget -q -O /tmp/java.tar.gz https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.3%2B7/OpenJDK17U-jre_x64_alpine-linux_hotspot_17.0.3_7.tar.gz \
  && tar --extract --file /tmp/java.tar.gz --directory $JAVA_HOME --strip-components 1 --no-same-owner \
  && rm -rf /tmp/*

WORKDIR /server
VOLUME /server

ENTRYPOINT ["java", "-jar", "/server.jar", "host"]