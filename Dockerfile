FROM java:8

MAINTAINER Jaap Karan Singh <jksdua@gmail.com>

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/traccar/

WORKDIR /usr/share/traccar/

RUN wget https://github.com/tananaev/traccar/releases/download/v3.14/traccar-linux-3.14.zip

RUN unzip traccar-linux-64-3.3.zip

RUN ./traccar.run

EXPOSE 8082

ENTRYPOINT /opt/traccar/bin/traccar start && tail -f /opt/traccar/logs/tracker-server.log
