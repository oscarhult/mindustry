FROM oscarhult/jre:17

EXPOSE 6567/tcp 6567/udp

ARG MINDUSTRY_VERSION=v142

ADD https://github.com/Anuken/Mindustry/releases/download/${MINDUSTRY_VERSION}/server-release.jar /server.jar

WORKDIR /mindustry
VOLUME /mindustry

ENTRYPOINT ["java", "-jar", "/server.jar", "host"]
