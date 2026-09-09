#!/bin/sh
set -e
CERT_DIR=/etc/nginx/ssl
mkdir -p "$CERT_DIR"
if [ ! -f "$CERT_DIR/fullchain.pem" ]; then
  openssl req -x509 -nodes -newkey rsa:2048 -days 3650 \
    -keyout "$CERT_DIR/privkey.pem" \
    -out "$CERT_DIR/fullchain.pem" \
    -subj "/CN=whatsapp_helpdesk_web"
fi
exec nginx -g 'daemon off;'
