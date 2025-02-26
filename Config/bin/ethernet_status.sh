#!/bin/sh

# Obtener la dirección IP
ip_address=$(/usr/sbin/ifconfig wlo1 | grep "inet " | awk '{print $2}')

# Verificar si está conectado
if [ -z "$ip_address" ]; then
    # Si no hay dirección IP, mostrar "Disconnected" con el icono
    echo "%{F#2495e7}睊 %{F#ffffff}Disconnected%{u-}"
else
    # Si hay dirección IP, mostrar la IP con el icono de conexión
    echo "%{F#2495e7}直 %{F#ffffff}$ip_address%{u-}"
fi

