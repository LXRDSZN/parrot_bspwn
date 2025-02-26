#!/bin/bash

# Array con los comandos para cambiar colores
commands=(
    "rogauracore multi_static ff0000 ffff00 00ff00 00ffff"
    "rogauracore single_colorcycle 1"
    "rogauracore single_static 00ff00"
    "rogauracore white"
)

# Leer el índice actual del archivo (si existe)
if [ -f ~/.config/rogauracore_index ]; then
    index=$(cat ~/.config/rogauracore_index)
else
    index=0
fi

# Ejecutar el comando actual
${commands[$index]}

# Incrementar el índice y reiniciar si es necesario
index=$(( (index + 1) % ${#commands[@]} ))

# Guardar el nuevo índice
echo $index > ~/.config/rogauracore_index

