# Usa la imagen oficial de PostgreSQL
FROM postgres

# Copia el archivo de configuración personalizado al contenedor
COPY my-postgres.conf /etc/postgresql/postgresql.conf

# Configura la contraseña de PostgreSQL
ENV POSTGRES_PASSWORD=mysecretpassword

# Exponer el puerto
EXPOSE 9876

# Ejecuta el servidor PostgreSQL con la configuración personalizada
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
