FROM codelab/msd-java

WORKDIR /usr/src/app

COPY *.jar ./app.jar

RUN chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
