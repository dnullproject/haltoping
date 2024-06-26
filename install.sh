#!/bin/bash

ROUTER_IP="${1}"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <router_ip>"
    exit 1
fi

SOURCE_DIR="$(dirname "$(readlink -f "$0")")"
SCRIPT_DEST="/usr/local/bin/haltoping"
SERVICE_DEST="/etc/systemd/system/"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cp "$SOURCE_DIR/haltoping" "$SCRIPT_DEST"
chmod +x "$SCRIPT_DEST"

echo "Installing haltoping service..."
cp "$SOURCE_DIR/haltoping.timer" "${SERVICE_DEST}/"
cp "$SOURCE_DIR/haltoping.service" "${SERVICE_DEST}/"
sed -i "s|ExecStart=.*|ExecStart=/usr/local/bin/haltoping ${ROUTER_IP}|g" "${SERVICE_DEST}/haltoping.service"

systemctl daemon-reload
systemctl disable haltoping.service
systemctl enable haltoping.timer
systemctl restart haltoping.service
systemctl status haltoping.service

echo "haltoping has been installed and started successfully."
