cat > ~/.config/waybar/scripts/mpris-throttle.sh << 'EOF'
#!/bin/bash
LOCKFILE="/tmp/mpris-throttle.lock"
if [ -f "$LOCKFILE" ]; then
    exit 0
fi
touch "$LOCKFILE"
playerctl "$1"
sleep 0.5
rm -f "$LOCKFILE"
EOF
chmod +x ~/.config/waybar/scripts/mpris-throttle.sh
