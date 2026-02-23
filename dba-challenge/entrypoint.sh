#!/bin/sh
set -e

DB_FILE="/opt/h2-data/challenge.mv.db"

# Detect first run before the server creates the database file
FIRST_RUN=false
if [ ! -f "$DB_FILE" ]; then
    FIRST_RUN=true
fi

echo "Starting H2 database server..."
java -cp /opt/h2/h2.jar org.h2.tools.Server \
    -tcp -tcpAllowOthers -tcpPort 9092 \
    -web -webAllowOthers -webPort 8082 \
    -baseDir /opt/h2-data \
    -ifNotExists &

H2_PID=$!

# Wait for H2 TCP port to be ready (up to 30 seconds)
RETRIES=30
until java -cp /opt/h2/h2.jar org.h2.tools.Shell \
        -url "jdbc:h2:tcp://localhost:9092/challenge" \
        -user sa -password "" \
        -sql "SELECT 1" >/dev/null 2>&1; do
    RETRIES=$((RETRIES - 1))
    if [ "$RETRIES" -eq 0 ]; then
        echo "ERROR: H2 server did not start in time." >&2
        exit 1
    fi
    sleep 1
done

if [ "$FIRST_RUN" = "true" ]; then
    echo "First run — loading challenge dataset..."
    java -cp /opt/h2/h2.jar org.h2.tools.RunScript \
        -url "jdbc:h2:tcp://localhost:9092/challenge" \
        -user sa -password "" \
        -script /opt/h2/init.sql
    echo "Challenge data loaded successfully."
else
    echo "Existing database found — skipping data load."
fi

echo ""
echo "============================================================"
echo "  DBA Challenge database is ready."
echo ""
echo "  Web Console : http://localhost:8082"
echo "  JDBC URL    : jdbc:h2:tcp://localhost:9092/challenge"
echo "  Username    : sa"
echo "  Password    : (leave blank)"
echo "============================================================"
echo ""

wait $H2_PID
