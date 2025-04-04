# Imagen base de Node
FROM node:18

# Crear directorio de trabajo en el contenedor
WORKDIR /app

# Copiar archivos de definición del proyecto
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer el puerto
EXPOSE 3000

# Comando para ejecutar la app
CMD [ "npm", "start" ]
