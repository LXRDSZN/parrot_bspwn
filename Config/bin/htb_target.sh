#!/bin/bash

# Obtener el porcentaje de uso de la CPU
cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

# Obtener el porcentaje de uso de la RAM
memory_usage=$(free | awk '/Mem:/ {printf("%.2f%%", $3/$2 * 100)}')

# Obtener el porcentaje de uso del almacenamiento
disk_usage=$(df -h / | awk '/\// {print $5}')

# Mostrar resultados
echo "CPU: $cpu_usage | RAM: $memory_usage | SSD: $disk_usage"

