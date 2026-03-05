# Ruby on Rails Technical Challenge

## Overview

You are building a small JSON API using Ruby on Rails. The skeleton project is already set up — routing, models, and test stubs are in place. Your job is to complete the implementation.

The challenge has four parts: write the database migrations, implement two API endpoints, create a serializer to shape the JSON response, and write tests covering the key scenarios.

---

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine + Compose plugin)

---

## Starting the Challenge

```bash
docker compose up --build
```

The first build downloads Ruby and installs all gems automatically.
Once the server is ready, the API is available at **http://localhost:3000**.

---

## Applying Migrations

After completing the migration files, apply them without restarting the server:

```bash
docker compose exec web bin/rails db:migrate
```

---

## Running Tests

```bash
docker compose run --rm web bundle exec rspec
```

---

## Data Model

Two models are already defined. Your task is to complete their migrations with appropriate columns and data types.

### `Person`

| Attribute | Description |
|---|---|
| `first_name` | — |
| `last_name` | — |
| `phone_number` | e.g. `555-666-7777` |
| `active` | Whether the person is currently active |
| `permission_codes` | The access codes this person holds |

### `Organization`

| Attribute | Description |
|---|---|
| `name` | — |
| `code` | A short identifier for the organization |
| `address` | — |
| `phone_number` | — |

---

## Your Tasks

### Part 1 — Migrations

Complete the empty migration files in `db/migrate/` so that the `people` and `organizations` tables are created with appropriate columns and data types.

---

### Part 2 — GET `/people/:id`

Implement the `show` action in `PeopleController`.

- Returns a **200** with a JSON body containing only `first_name`, `last_name`, and `phone_number`.
- Returns a **404** if the person does not exist.

```
GET /people/735  →  200  { first_name: "Tua", last_name: "Tagovailoa", phone_number: "555-666-7777" }
GET /people/999  →  404  { error: "Person not found" }
```

---

### Part 3 — POST `/people/:id/check_access`

Implement the `check_access` action in `PeopleController`.

A person has access to an organization if **both** of the following are true:
- The person is marked `active`.
- At least one of their `permission_codes` matches the organization's `code`.

The request body provides the organization to check against:

```json
{ "organization": { "id": 257948 } }
```

- Returns a **200** with `{ access: true }` or `{ access: false }`.
- Returns a **404** if the person does not exist.

```
POST /people/735/check_access  { organization: { id: 257948 } }  →  200  { access: true }
POST /people/736/check_access  { organization: { id: 257948 } }  →  200  { access: false }
```

---

### Part 4 — Tests

The test file at `spec/requests/people_controller_request_spec.rb` contains stubs for all required scenarios. Fill in the test bodies:

**GET `/people/:id`**
- Person exists and is returned successfully
- Person does not exist (404)

**POST `/people/:id/check_access`**
- Person does not exist (404)
- Person exists but is inactive → `{ access: false }`
- Person is active but has no matching permission code → `{ access: false }`
- Person is active with a matching permission code → `{ access: true }`

---

## Sample Data

The following records can be used as a reference for manual testing. You can add them to `db/seeds.rb` and run `docker compose exec web bin/rails db:seed`, or create them directly in the Rails console.

```ruby
Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, active: true,  permission_codes: ['123', '456'])
Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, active: true,  permission_codes: ['123'])
Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, active: false, permission_codes: ['123', '456'])
Organization.create(name: Faker::Company.name, code: '123', address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number)
Organization.create(name: Faker::Company.name, code: '456', address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number)
```

---

## Stopping

```bash
# Stop containers, keep data
docker compose down

# Stop containers AND wipe the database (clean slate)
docker compose down -v
```

---

## Resetting to a Fresh State

```bash
docker compose down -v
docker compose up
```

