FROM debian:buster

RUN apt-get update && apt-get install -y "libssl1.1" ca-certificates certbot

WORKDIR /opt/status-page

COPY target/release/wavy-status-page .
COPY index.html .
COPY run-with-https.sh .

RUN chmod +x ./run-with-https.sh
RUN mkdir status

CMD ["/opt/status-page/run-with-https.sh"]
