# PATH configuration
set -gx PATH "/home/ym1co/.local/bin" $PATH
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Autostart Niri on TTY login with delay
if status is-login
    if test -z "$WAYLAND_DISPLAY"; and string match -q "/dev/tty*" (tty)
        echo "Запуск Niri через 3 секунды... (Ctrl+C для отмены)"
        sleep 3
        exec niri-session
    end
end

if status is-interactive
    fastfetch
end
