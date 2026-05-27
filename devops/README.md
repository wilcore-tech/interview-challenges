# DevOps Interview Challenge

## Overview

This challenge evaluates a DevOps professional's understanding of containerization, application configuration, database management, and infrastructure-as-code concepts using the projects in this repository.

The challenge is meant to be a working session with a Senior Devops professional to guage breath and depth for each concept. Junior and Senior DevOps professionals are weighted for their respective role.

## Core Concepts

| Concept | Why It Matters |
|---------|---------------|
| Port mapping | `host:container` format. If it's wrong, the app is unreachable. |
| Environment variables | How secrets and config reach containers without hardcoding. |
| Build vs runtime | What happens in `docker build` vs `docker run`. |
| Volumes | Persist data beyond container lifecycle. |
| Health checks | Confirm a service is actually ready, not just running. |
| Logs | `docker compose logs -f` is your primary debugging tool. |
| Container networking | Containers talk to each other by service name, not `localhost`. |
| CI/CD pipelines | Docker and compose files power automated build/test/deploy workflows. |
| Git fundamentals | Branching, pull requests, `.gitignore` for keeping repos clean. |
| Infrastructure as Code | Docker/compose files are infrastructure defined in code. |

## Challenge Tasks

### Task 1: Run and Debug Existing Containers

1. Start the DBA challenge with `docker compose up` in the `dba-challenge/` directory.
2. Start the Rails challenge with `docker compose up` in the `ruby-on-rails/` directory.
3. Identify and document any issues you encounter (port mappings, permissions, connectivity).

### Task 2: Dockerize the Java Challenge

The `java/spring-boot-challenge/` project has no Docker setup. Create the following:

- A `Dockerfile` that builds and runs the Spring Boot application.
- A `docker-compose.yml` that exposes the application on port 8080.
- Verify the H2 console is accessible at `http://localhost:8080/h2-console`.

### Task 3: Identify Configuration Issues

Review the existing projects and document any problems you find. Here are some hints:

- Check port mappings in `docker-compose.yml` files against what the README documents say.
- Look for missing file permissions.
- Check for a `.gitignore` file at the repository root.
- Verify that database connection instructions match the actual container configuration.

### Task 4: CI/CD Pipeline (Bonus)

Design a GitHub Actions workflow that:

1. Builds the Docker images for all three backend challenges.
2. Runs the test suites (RSpec for Rails, Maven tests for Java).
3. Reports build/test status.

## Deliverables

- Written answers to Tasks 1 and 3 documenting issues found and proposed fixes.
- Working `Dockerfile` and `docker-compose.yml` for the Java challenge (Task 2).
- GitHub Actions YAML file (Task 4, bonus).

## Getting Started

```bash
# Clone the repository
git clone <repo-url>
cd interview-challenges

# Verify Docker is installed
docker --version
docker compose version

# Start with Task 1
cd dba-challenge
docker compose up
```

## Evaluation Criteria

- Ability to read and understand Dockerfiles and compose configurations.
- Debugging skills when containers don't behave as expected.
- Understanding of port mapping, networking, and environment configuration.
- Clean, production-ready Docker setup for the Java challenge.
- Clear written communication when documenting issues.
