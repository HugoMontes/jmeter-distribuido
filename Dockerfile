FROM eclipse-temurin:17-jre-jammy

ENV JMETER_VERSION=5.6.3
ENV JMETER_HOME=/opt/apache-jmeter-${JMETER_VERSION}
ENV PATH=$JMETER_HOME/bin:$PATH

RUN apt-get update && apt-get install -y wget unzip procps && \
    wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz -P /opt && \
    tar -xzf /opt/apache-jmeter-${JMETER_VERSION}.tgz -C /opt && \
    rm /opt/apache-jmeter-${JMETER_VERSION}.tgz && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "server.rmi.ssl.disable=true" >> $JMETER_HOME/bin/jmeter.properties

WORKDIR /jmeter