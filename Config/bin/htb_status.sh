#!/bin/sh

# Obtener la interfaz de VPN activa (tun, ppp o nordlynx)
IFACE=$(ip a | grep -E 'tun|ppp|nordlynx' | awk '{print $2}' | tr -d ':' | head -n 1)

# Verificar si se encontró una interfaz de VPN
if [ -n "$IFACE" ]; then
    # Obtener la dirección IP de la interfaz activa
    IP=$(ip addr show "$IFACE" | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
    echo "%{F#1bbf3e} %{F#ffffff}$IP%{u-}"
else
    echo "%{F#1bbf3e}%{u-} Disconnected"
fi

