#!/bin/bash

# Obtener el estado actual de la batería
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Definir el icono de carga si la batería está cargando
if [ "$battery_status" == "Charging" ]; then
    battery_icon=""
    
    # Notificar cuando la batería esté completamente cargada
    if [ "$battery_capacity" -ge 100 ]; then
        notify-send "Batería completamente cargada" "Puedes desconectar el cargador."
    fi

    echo "$battery_icon $battery_capacity%"
else
    # Notificar cuando se desconecta el cargador
    if [ "$battery_status" == "Discharging" ] && [ "$previous_status" == "Charging" ]; then
        notify-send "Cargador desconectado" "La batería se está usando."
    fi

    # Notificar cuando la batería esté al 20%
    if [ "$battery_capacity" -le 20 ]; then
        notify-send "Advertencia: Batería baja" "La batería está al $battery_capacity%. Conecta el cargador."
    fi

    # Definir el icono de advertencia si la batería está al 25%
    if [ "$battery_capacity" -eq 25 ]; then
        warning_icon="!"
    else
        warning_icon=""
    fi

    # Definir el icono de capacidad de la batería
    if [ "$battery_capacity" -le 10 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 20 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 30 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 40 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 50 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 60 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 70 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 80 ]; then
        battery_icon=""
    elif [ "$battery_capacity" -le 90 ]; then
        battery_icon=""
    else
        battery_icon=""
    fi

    # Mostrar el estado de la batería con el icono, el porcentaje y los iconos adicionales
    echo "$battery_icon $battery_capacity% $warning_icon"
fi

# Guardar el estado actual para comparación futura
echo "$battery_status" > /tmp/previous_battery_status

