FROM java:8
VOLUME /tmp
ARG APP_PATH=/sbadmin
ARG ENVIRONMENT

RUN mkdir -p sbadmin
COPY ./target/sbadmin-0.0.1.jar ${APP_PATH}/app.jar
COPY ./target/classes/application.properties ${APP_PATH}/application.properties
WORKDIR ${APP_PATH}
RUN readlink -f application.properties
EXPOSE 8080
CMD java -jar app.jar