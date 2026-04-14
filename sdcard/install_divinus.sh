#!/bin/sh
set -e
SD="/mnt/mmcblk0p1"

echo "[install] Remounting rootfs as rw..."
mount -o remount,rw /

echo "[install] Disabling majestic..."
[ -f /etc/init.d/S95majestic ] && mv /etc/init.d/S95majestic /etc/init.d/S95majestic.disabled
killall -9 majestic 2>/dev/null || true

echo "[install] Copying divinus binary..."
cp "$SD/divinus" /usr/bin/divinus
chmod +x /usr/bin/divinus

echo "[install] Copying config..."
cp "$SD/divinus.yaml" /etc/divinus.yaml

echo "[install] Installing service..."
cp "$SD/S95divinus" /etc/init.d/S95divinus
chmod +x /etc/init.d/S95divinus

echo "[install] Done! Divinus installed."
