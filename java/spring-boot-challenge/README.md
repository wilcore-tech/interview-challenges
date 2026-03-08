# Address Book (Spring Boot)

## Prerequisites

Before starting, ensure you have the following installed:

- **Java 17+** (JDK) - [Download from Adoptium](https://adoptium.net/) or [Oracle](https://www.oracle.com/java/technologies/downloads/)
- **Maven 3.8+** - [Download from Apache](https://maven.apache.org/download.cgi)
- **IDE** (recommended) - IntelliJ IDEA, VS Code with Java extensions, or Eclipse

Verify your installation:
```bash
java -version   # Should show 17 or higher
mvn -version    # Should show 3.8 or higher
```

---

## Overview

Create a RESTful API using **Spring Boot**, **Java**, and **Hibernate/JPA**, following industry-recognized standards and best practices.

The API should allow clients to view, search, and edit the contact database. You will utilize an **H2 in-memory database**; the database configuration and sample data are provided.

---

## Details

> ⚠️ **Complete these in order:**
> 1. First, complete all **Core Requirements** below
> 2. Then, choose **one** of the two paths (A or B) based on your interview focus

---

### Step 1: Core Requirements *(Required for All Candidates)*

Create endpoints that do each of the following things. You should decide appropriate naming and methods.

- [ ] **List all contacts** with options for pagination and sorting
  - *Example: Get page 2 of 10 contacts, sorted by lastName in descending order.*
- [ ] **View details** for a specific contact
  - *Example: Retrieve the contact with ID 5.*
- [ ] **Create** a new contact. Return the created contact with its assigned ID.

---

### Step 2: Choose Your Path

**After completing the core requirements above**, complete **ONE** of the following paths:

---

#### Path A: Standard CRUD *(Default)*

Complete the traditional CRUD operations:

- **Update** an existing contact.
- **Delete** a contact.
- **Search** contacts by name, email, city, or state. Support pagination and sorting on results.
  - *Example: Search for "smith", return page 1 with 5 results, sorted by city ascending.*

---

#### Path B: Identity & Access Control *(For Identity-Focused Roles)*

> **Background Context:**
> 
> In identity management systems, users often have different "account levels" based on how thoroughly their identity has been verified. For example:
> - **BASIC** - User created an account but hasn't proven who they are yet
> - **VERIFIED** - User has completed identity verification (e.g., matched personal info)
> - **PREMIUM** - User has completed enhanced verification (e.g., in-person proofing)
> 
> Certain features or data may only be accessible to users who have reached a minimum account level. Additionally, all verification attempts (successful or not) should be logged for security and compliance purposes.

Complete the following identity-focused features:

1. **Account Levels**: Each contact has an `account_level` that starts as `BASIC`. This field already exists in the database.

2. **Identity Verification Endpoint**: Create an endpoint to verify a contact's identity.
   - Accept the contact's ID along with verification data (last 4 digits of SSN + date of birth)
   - Compare against the stored values in the database
   - If matched, upgrade the contact's `account_level` from `BASIC` to `VERIFIED`
   - If not matched, return an appropriate error

3. **Access-Controlled Endpoint**: Create a "secure details" endpoint that returns sensitive contact information.
   - This endpoint should **only** return data for contacts with `account_level` of `VERIFIED` or higher
   - Return a 403 Forbidden if the contact is still `BASIC`

4. **Audit Logging**: Log all verification attempts to the `verification_audits` table.
   - Record: which contact, when, success or failure
   - The audit table already exists in the database schema

---

### Database

The H2 database is pre-configured with sample data.

#### `contacts` table columns:
| Column | Description |
|--------|-------------|
| id | Primary key |
| first_name | Contact's first name |
| last_name | Contact's last name |
| street | Street address |
| city | City |
| state | State |
| zip | ZIP code |
| phone | Phone number |
| email | Email address |
| account_level | *Path B only* - BASIC, VERIFIED, or PREMIUM |
| last_four_ssn | *Path B only* - Last 4 digits of SSN for verification |
| date_of_birth | *Path B only* - Date of birth for verification |
| verification_date | *Path B only* - When identity was verified |

#### `verification_audits` table columns *(Path B only)*:
| Column | Description |
|--------|-------------|
| id | Primary key |
| contact_id | Which contact was being verified |
| attempted_at | When the verification was attempted |
| success | Whether verification succeeded (true/false) |
| failure_reason | Why it failed (null if successful) |

> **Note:** Path A candidates can ignore the identity-related columns - they won't affect your implementation.

### What's Provided

- `pom.xml` - Maven build file with Spring Boot, JPA, H2, and Validation dependencies
- `application.properties` - H2 database configuration (ready to use)
- `schema.sql` - Creates the database tables on startup
- `data.sql` - Seeds 15 sample contacts (with identity data for Path B)
- `AddressBookApplication.java` - Spring Boot entry point
- **Model classes** (in `io.wilcore.addressbook.model`):
  - `Contact.java` - JPA entity mapped to the `contacts` table
  - `VerificationAudit.java` - JPA entity for audit logging (Path B)
  - `AccountLevel.java` - Enum for account verification levels (Path B)

---

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/wilcore-tech/backend-spring-boot-challenge.git
   cd backend-spring-boot-challenge
   ```

2. **Install dependencies and build**
   ```bash
   mvn clean install
   ```

3. **Run the application**
   ```bash
   mvn spring-boot:run
   ```

4. **Verify it's running**
   - API: http://localhost:8080
   - H2 Console: http://localhost:8080/h2-console

### H2 Database Console

The H2 Console (for debugging) is available at `http://localhost:8080/h2-console`:
- JDBC URL: `jdbc:h2:mem:addressbook`
- Username: `sa`
- Password: *(leave empty)*

### Documentation/API Client

You do not need to create a front end. Optionally, you can create tests or Postman/Bruno collections to show your API's operation. As an alternative, at least provide some documentation in a README so we know how to make requests.
