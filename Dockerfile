FROM tobyxdd/hysteria:v2

RUN apk add --no-cache ca-certificates tzdata

# Создаём папки
RUN mkdir -p /etc/hysteria /var/www/masq

# Копируем конфиг и заглушку сайта
COPY config.yaml /etc/hysteria/config.yaml
COPY index.html /var/www/masq/index.html

EXPOSE 443/udp

CMD ["server", "-c", "/etc/hysteria/config.yaml"]
