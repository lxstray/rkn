FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://github.com/apernet/hysteria/releases/latest/download/hysteria-linux-amd64 -o /usr/local/bin/hysteria \
    && chmod +x /usr/local/bin/hysteria \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/masq 

WORKDIR /app
COPY config.yaml /etc/hysteria/config.yaml
COPY index.html /vat/www/masq

EXPOSE 443/udp

# Главный процесс — hysteria server
CMD ["hysteria", "server", "-c", "/etc/hysteria/config.yaml"]
