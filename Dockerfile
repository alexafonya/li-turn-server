FROM alpine:latest
RUN apk add --no-cache coturn
EXPOSE 3478/tcp 3478/udp
CMD ["sh", "-c", "turnserver -n --lt-cred-mech --user=${TURN_USER}:${TURN_PASS} --realm=livingisrael --log-file=stdout"]
