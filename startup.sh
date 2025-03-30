#!/bin/bash

# Instalar controladores ODBC para SQL Server
apt-get update && apt-get install -y \
    unixodbc \
    unixodbc-dev \
    libodbc1 \
    odbcinst \
    odbcinst1debian2 \
    libssl-dev \
    curl

# Descargar e instalar el controlador ODBC de Microsoft
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17

# Ejecutar la aplicación
python3 -m gunicorn app:app

