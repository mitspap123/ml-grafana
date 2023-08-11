FROM grafana/grafana:latest

EXPOSE 3000

USER root

COPY /conf/grafana.ini /etc/grafana/grafana.ini
COPY /plugins/mongodb-grafana /var/lib/grafana/plugins/

RUN apk update && apk add --update npm

ENTRYPOINT [ "/run.sh" ]