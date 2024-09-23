FROM openjdk:21
COPY ./target/spe-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD [“java”,”-cp”,” spe-1.0-SNAPSHOT-jar-with-dependencies.jar”,”org.example.Main”]