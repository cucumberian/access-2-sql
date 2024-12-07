FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get install mdbtools -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data/
WORKDIR /data/


COPY scripts/access2sql.sh /usr/local/bin/access2sql.sh
RUN chmod +x /usr/local/bin/access2sql.sh

ENTRYPOINT [ "access2sql.sh" ]
