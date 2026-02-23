# DBA Technical Challenge

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine + Compose plugin)

---

## Starting the Challenge

```bash
docker compose up --build
```

---

## Accessing the Database

### Option 1 — H2 Web Console (browser, no extra tooling required)

Open **http://localhost:8082** and connect with:

| Field    | Value                                     |
|----------|-------------------------------------------|
| JDBC URL | `jdbc:h2:tcp://localhost:9092/challenge`  |
| Username | `sa`                                      |
| Password | *(leave blank)*                           |

---

## Stopping

```bash
# Stop containers, keep data
docker compose down

# Stop containers AND wipe the database (clean slate)
docker compose down -v
```

---

## Resetting to a Fresh Dataset

```bash
docker compose down -v
docker compose up
```


