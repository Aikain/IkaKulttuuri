FROM openjdk:8

RUN apt-get update
RUN apt-get install -y maven

WORKDIR /code
ADD pom.xml /code/pom.xml
RUN mvn dependency:resolve

ADD src /code/src

RUN mvn verify
RUN mvn clean compile

CMD mvn exec:java
