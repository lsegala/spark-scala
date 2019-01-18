FROM openjdk:8
WORKDIR /App
RUN curl https://archive.apache.org/dist/spark/spark-1.2.0/spark-1.2.0-bin-hadoop2.4.tgz --output spark-1.2.0-bin-hadoop2.4.tgz --silent &&\
    curl https://scala-lang.org/files/archive/scala-2.10.4.tgz?_ga=2.15883763.437791435.1545956260-536811945.1545942107 --output scala-2.10.4.tgz --silent &&\
    tar xvzf scala-2.10.4.tgz &&\
	tar xvzf spark-1.2.0-bin-hadoop2.4.tgz &&\
	apt-get update &&\
	apt-get install apt-transport-https &&\
	echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list &&\
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 &&\
	apt-get update &&\
	apt-get --assume-yes --allow-unauthenticated install sbt

COPY log4j.properties /App/spark-1.2.0-bin-hadoop2.4/conf

ENV SCALA_HOME /App/scala-2.10.4
ENV SPARK_HOME /App/spark-1.2.0-bin-hadoop2.4
ENV PATH $PATH:$SCALA_HOME/bin:$SPARK_HOME/bin