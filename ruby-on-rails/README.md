Basic RoR MVC code challenge to be completed supervised during a 60-75 minute interview.

Instructions:

To set up your Ruby on Rails environment:
- Refer to SETUP.md

Given the following structure:
- There is a model class named `Person` association with a database table `people` with the following attributes:
  `first_name`, `last_name`, `phone_number`, `date_of_birth`, `active` and `permission_codes`
- There is another model class named `Organization` with a database table `organizations` with the following attributes:
  `name`, `code`, `address`, `phone_number`

Create a Ruby on Rails app that meets the following criteria:
1) The project will have migrations for above data format. Determine the best data types for the required attributes.

2) There is an endpoint at (GET) /people/{:id} which returns a JSON representation of a person, though only returning first_name,
last_name, and phone_number. If the person is not found or not marked active, it returns a 404 HTTP status.
Example: GET /people/735 returns 200 with body: `{ first_name: 'Tua', last_name: 'Tagovailoa', phone_number: '555-666-7777' }`
Example: Get /people/737 returns 404 with body: `{ error: 'Person not found' }`

3) There is an endpoint at (POST) /people/{:id}/check_access which returns a JSON representation on whether a `person` has access to an
`organization`. If one of the `person`'s `permission_codes` matches the organization's `code` and is marked `active`, then
the `person` is considered to have access. 

Example: POST to /people/735/check_access with body: `{ organization: { id: 257948 }}`
result: 200 with body: `{ access: true }`
Example: POST to /people/736/check_access with body: `{ organization: { id: 257948 }}`
result: 200 with body: `{ access: false }`

4) There are tests written for both endpoints:
- GET `people` endpoint with scenario where a person is returned
- GET `people` endpoint with scenario where a person is not found because they do not exist
- GET `people` endpoint with scenario where a person is not found because they are marked inactive
- POST `people/check_access` endpoint with scenario where a person has access to the organization
- POST `people/check_access` endpoint with scenario where a person does not have access to the organization because they do not have a matching access code
- POST `people/check_access` endpoint with scenario where a person does not have access to the organization because they are inactive

Sample data:
```
Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, date_of_birth: Faker::Date.between(from: 80.years.ago, to: 18.years.ago), active: 'true', permission_codes: "[123, 456]")
Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, date_of_birth: Faker::Date.between(from: 80.years.ago, to: 18.years.ago), active: 'true', permission_codes: "[123]")
Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, date_of_birth: Faker::Date.between(from: 80.years.ago, to: 18.years.ago), active: 'false', permission_codes: "[123, 456]")
Organization.create(name: Faker::Company.name, code: '123', address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number)
Organization.create(name: Faker::Company.name, code: '456', address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number)
```

