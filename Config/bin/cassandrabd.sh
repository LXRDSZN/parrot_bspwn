#!/bin/bash

# Función para ejecutar comandos en cqlsh
ejecutar_cql() {
    echo "$1" | python3.10 ~/cassandra/bin/cqlsh.py
}

# Función para crear una base de datos (keyspace)
crear_base_de_datos() {
    read -p "Ingrese el nombre de la base de datos (keyspace): " DB_NAME
    ejecutar_cql "CREATE KEYSPACE IF NOT EXISTS $DB_NAME WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};"
    echo "Base de datos $DB_NAME creada."
}
# Funcion para borrar una base de datos 
borrar_base_datos(){
  read -p "Nombre de la base de datos para borrar (keyspace) : " DROP_NAME
  ejecutar_cql "DROP KEYSPACE $DROP_NAME ;"
  echo "KEYSPACE $DROP_NAME BORRADO"
}

# Función para crear una tabla
crear_tabla() {
    read -p "Ingrese el nombre de la tabla: " TABLE_NAME
    echo "Ingrese los campos de la tabla en formato (nombre tipo, ...). Ejemplo: id UUID PRIMARY KEY, nombre text, edad int"
    read -p "Campos: " CAMPOS
    ejecutar_cql "USE $DB_NAME; CREATE TABLE IF NOT EXISTS $TABLE_NAME ($CAMPOS);"
    echo "Tabla $TABLE_NAME creada con los campos: $CAMPOS"
}

# Función para insertar datos
insertar_datos() {
    read -p "Ingrese el nombre de la tabla: " TABLE_NAME
    read -p "Ingrese los nombres de los campos separados por coma: " CAMPOS
    read -p "Ingrese los valores de los campos separados por coma: " VALORES
    ejecutar_cql "USE $DB_NAME; INSERT INTO $TABLE_NAME ($CAMPOS) VALUES ($VALORES);"
    echo "Datos insertados en $TABLE_NAME."
}

# Función para actualizar datos
actualizar_datos() {
    read -p "Ingrese el nombre de la tabla: " TABLE_NAME
    read -p "Ingrese la condición para actualizar (Ejemplo: id=1): " CONDICION
    read -p "Ingrese los valores a actualizar (Ejemplo: nombre='NuevoNombre'): " VALORES
    ejecutar_cql "USE $DB_NAME; UPDATE $TABLE_NAME SET $VALORES WHERE $CONDICION;"
    echo "Datos actualizados en $TABLE_NAME."
}

# Función para eliminar registros
eliminar_registros() {
    read -p "Ingrese el nombre de la tabla: " TABLE_NAME
    read -p "Ingrese la condición para eliminar registros (Ejemplo: id=1): " CONDICION
    ejecutar_cql "USE $DB_NAME; DELETE FROM $TABLE_NAME WHERE $CONDICION;"
    echo "Registros eliminados en $TABLE_NAME."
}

# Función para eliminar una tabla
eliminar_tabla() {
    read -p "Ingrese el nombre de la tabla a eliminar: " TABLE_NAME
    ejecutar_cql "USE $DB_NAME; DROP TABLE IF EXISTS $TABLE_NAME;"
    echo "Tabla $TABLE_NAME eliminada."
}
# Funciones para realizar Consultas de Keyspaces
Consulta_keyspaces(){
    read -p "Consualta de keyspaces en cassandra"
     
}

# Menú principal
while true; do
    echo "\nMenú Principal"
    echo "1. Crear base de datos"
    echo "2. Crear tabla"
    echo "3. Insertar datos"
    echo "4. Actualizar datos"
    echo "5. Eliminar registros"
    echo "6. Eliminar tabla"
    echo "7. Borrar Keyspace"
    echo "8. Consulta Keyspaces"
    echo "9. Consulta tablas Keyspace"
    echo "10. Salir"
    read -p "Seleccione una opción: " OPCION

    case $OPCION in
        1) crear_base_de_datos ;;
        2) crear_tabla ;;
        3) insertar_datos ;;
        4) actualizar_datos ;;
        5) eliminar_registros ;;
        6) eliminar_tabla ;;
        7) borrar_base_datos;;
        8) Consulta_keyspaces;;
        10) exit 0 ;;
        *) echo "Opción no válida" ;;
    esac
done





