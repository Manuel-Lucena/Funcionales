# 1️⃣ Etapa de compilación: JDK + Git
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Instalar git (solo si la imagen no lo trae)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clonar tu repositorio
RUN git clone https://github.com/usuario/tu-proyecto.git .

# Compilar el código fuente
RUN javac -d out src/*.java

# Crear un JAR ejecutable
RUN jar cfe app.jar App -C out .

# 2️⃣ Etapa de ejecución: JRE solo
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copiar el JAR compilado desde la etapa build
COPY --from=build /app/app.jar app.jar

# Comando por defecto
CMD ["java","-jar","app.jar"]
