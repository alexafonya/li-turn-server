FROM alpine:latest
RUN apk add --no-cache coturn
EXPOSE 3478/tcp 3478/udp
CMD coturn -n \
    --log-file=stdout \
    --lt-cred-mech \
    --user=$TURN_USER:$TURN_PASS \
    --realm=living-israel-church \
    --external-ip=$(wget -qO- https://ifconfig.me)
