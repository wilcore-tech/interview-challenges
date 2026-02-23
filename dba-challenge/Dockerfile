FROM eclipse-temurin:17-jre

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/h2 /opt/h2-data && \
    curl -fsSL "https://repo1.maven.org/maven2/com/h2database/h2/2.2.224/h2-2.2.224.jar" \
         -o /opt/h2/h2.jar

COPY data/challenge_export.sql /opt/h2/init.sql
COPY entrypoint.sh /opt/h2/entrypoint.sh
RUN chmod +x /opt/h2/entrypoint.sh

VOLUME /opt/h2-data
EXPOSE 8082 9092

WORKDIR /opt/h2
ENTRYPOINT ["/opt/h2/entrypoint.sh"]
