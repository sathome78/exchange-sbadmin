FROM java:8
VOLUME /tmp
ARG APP_PATH=/sbadmin
ARG ENVIRONMENT

RUN mkdir -p sbadmin
COPY ./target/sbadmin.jar ${APP_PATH}/sbadmin.jar
COPY ./target/config/${ENVIRONMENT}/application.yml ${APP_PATH}/application.yml

ARG CONFIG_FILE_PATH="-Dspring.config.location="${ENVIRONMENT}"/application.yml"

WORKDIR ${APP_PATH}

EXPOSE 8080
CMD java -jar sbadmin.jar CONFIG_FILE_PATH