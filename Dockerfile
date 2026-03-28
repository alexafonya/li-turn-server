FROM alpine:latest

# Устанавливаем сервер
RUN apk add --no-cache coturn

# Открываем порт
EXPOSE 3478

# Запуск с упрощенными флагами
# Мы убираем сложные проверки и запускаем максимально прямо
CMD turnserver -n \
    --log-file=stdout \
    --external-ip=$(wget -qO- https://ifconfig.me) \
    --user=$TURN_USER:$TURN_PASS \
    --realm=livingisrael \
    --lt-cred-mech
