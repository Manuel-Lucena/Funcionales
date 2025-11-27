FROM eclipse-temurin:17-jdk AS build
WORKDIR /app


RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/Manuel-Lucena/Funcionales.git .


RUN javac -d out src/*.java


RUN jar cfe app.jar App -C out .


FROM eclipse-temurin:17-jre
WORKDIR /app


COPY --from=build /app/app.jar app.jar

CMD ["java","-jar","app.jar"]
