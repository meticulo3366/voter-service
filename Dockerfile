#FROM frolvlad/alpine-oraclejdk8:full
#VOLUME /tmp
#COPY . .
#RUN sh -c 'ls'
# RUN apk add bash bash-doc bash-completion
#RUN apk add --update bash && rm -rf /var/cache/apk/*
# RUN setenv SHELL /bin/bash && exec /bin/bash --login
#RUN /bin/bash gradlew clean cleanTest build
# ENV JAVA_OPTS=""
#ENTRYPOINT [ "sh", "-c", "java -jar build/libs/voter-service-0.2.0.jar" ]

FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD build/libs/voter-service*.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]