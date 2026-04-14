#!/bin/sh
LOG="/mnt/sdcard/install.log"
echo "=== RunCam Divinus Installer $(date) ===" >> "$LOG"

if [ -f /usr/bin/divinus ] && [ -f /etc/divinus.yaml ]; then
    echo "[autorun] Already installed, skip." >> "$LOG"
    exit 0
fi

if [ ! -f /mnt/sdcard/install_divinus.sh ]; then
    echo "[autorun] ERROR: install_divinus.sh not found!" >> "$LOG"
    exit 1
fi

chmod +x /mnt/sdcard/install_divinus.sh
sh /mnt/sdcard/install_divinus.sh 2>&1 | tee -a "$LOG"
sleep 5 && reboot
