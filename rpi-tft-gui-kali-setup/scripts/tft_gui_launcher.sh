#!/bin/bash
# Launch GUI manually on TFT /dev/fb0

echo "Stopping display manager..."
sudo systemctl stop lightdm

echo "Creating .xinitrc..."
echo 'exec startlxde' > ~/.xinitrc

echo "Launching GUI on /dev/fb0..."
xinit -- -fb /dev/fb0
