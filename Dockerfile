FROM alpine:latest

# Install Asterisk
RUN apk add --no-cache asterisk asterisk-sample-config asterisk-sounds-en

# Copy our configs
COPY configs/sip.conf /etc/asterisk/sip.conf
COPY configs/extensions.conf /etc/asterisk/extensions.conf
COPY configs/asterisk.conf /etc/asterisk/asterisk.conf

# Expose SIP and RTP ports
EXPOSE 5060/udp 5060/tcp
EXPOSE 10000-10100/udp

CMD ["asterisk", "-f", "-vvvg"]
