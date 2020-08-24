FROM nginx:alpine

RUN apk update && apk add --no-cache tini bind-tools

ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /bin/confd

RUN chmod +x /bin/confd

COPY run.sh /bin/run.sh

COPY confd /etc/confd

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/bin/run.sh"]
