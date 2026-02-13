FROM alpine:latest

# Install Asterisk and a simple HTTP server
RUN apk add --no-cache asterisk asterisk-sample-config asterisk-sounds-en python3

# Copy our configs
COPY configs/sip.conf /etc/asterisk/sip.conf
COPY configs/extensions.conf /etc/asterisk/extensions.conf
COPY configs/asterisk.conf /etc/asterisk/asterisk.conf

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose SIP and HTTP ports
EXPOSE 5060/udp 5060/tcp
EXPOSE 10000-10100/udp
EXPOSE ${PORT:-8080}

CMD ["/start.sh"]
