FROM alpine:latest

# Устанавливаем сервер
RUN apk add --no-cache coturn

# Открываем порты (TCP и UDP)
EXPOSE 3478/tcp 3478/udp

# Используем оболочку sh, чтобы переменные TURN_USER и TURN_PASS точно подставились
CMD ["sh", "-c", "turnserver -n --lt-cred-mech --user=${TURN_USER}:${TURN_PASS} --realm=livingisrael --log-file=stdout --external-ip=$(wget -qO- https://ifconfig.me)"]
