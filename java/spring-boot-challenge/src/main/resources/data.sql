-- Sample contacts with identity verification data (Path B fields)
-- All contacts start as BASIC with SSN/DOB populated for verification testing
INSERT INTO contacts (first_name, last_name, street, city, state, zip, phone, email, account_level, last_four_ssn, date_of_birth) VALUES
('Alice', 'Johnson', '123 Main St', 'Springfield', 'IL', '62701', '555-0101', 'alice.johnson@example.com', 'BASIC', '1234', '1985-03-15'),
('Bob', 'Smith', '456 Oak Ave', 'Chicago', 'IL', '60601', '555-0102', 'bob.smith@example.com', 'BASIC', '5678', '1990-07-22'),
('Carol', 'Williams', '789 Pine Rd', 'Austin', 'TX', '78701', '555-0103', 'carol.williams@example.com', 'BASIC', '9012', '1988-11-30'),
('David', 'Brown', '321 Elm St', 'Seattle', 'WA', '98101', '555-0104', 'david.brown@example.com', 'BASIC', '3456', '1992-01-08'),
('Eva', 'Davis', '654 Maple Dr', 'Denver', 'CO', '80201', '555-0105', 'eva.davis@example.com', 'BASIC', '7890', '1987-05-25'),
('Frank', 'Miller', '987 Cedar Ln', 'Boston', 'MA', '02101', '555-0106', 'frank.miller@example.com', 'BASIC', '2345', '1995-09-12'),
('Grace', 'Wilson', '147 Birch Way', 'Portland', 'OR', '97201', '555-0107', 'grace.wilson@example.com', 'BASIC', '6789', '1983-12-03'),
('Henry', 'Moore', '258 Spruce Ct', 'Miami', 'FL', '33101', '555-0108', 'henry.moore@example.com', 'BASIC', '0123', '1991-06-18'),
('Ivy', 'Taylor', '369 Walnut Pl', 'Atlanta', 'GA', '30301', '555-0109', 'ivy.taylor@example.com', 'BASIC', '4567', '1986-02-28'),
('Jack', 'Anderson', '741 Hickory Blvd', 'Phoenix', 'AZ', '85001', '555-0110', 'jack.anderson@example.com', 'BASIC', '8901', '1993-08-07'),
('Karen', 'Thomas', '852 Chestnut Ave', 'San Diego', 'CA', '92101', '555-0111', 'karen.thomas@example.com', 'BASIC', '2346', '1989-04-14'),
('Leo', 'Jackson', '963 Poplar St', 'Dallas', 'TX', '75201', '555-0112', 'leo.jackson@example.com', 'BASIC', '6780', '1994-10-21'),
('Mia', 'White', '159 Willow Dr', 'Minneapolis', 'MN', '55401', '555-0113', 'mia.white@example.com', 'BASIC', '0124', '1984-07-09'),
('Nick', 'Harris', '267 Ash Rd', 'Detroit', 'MI', '48201', '555-0114', 'nick.harris@example.com', 'BASIC', '4568', '1996-01-31'),
('Olivia', 'Martin', '378 Beech Ln', 'Philadelphia', 'PA', '19101', '555-0115', 'olivia.martin@example.com', 'BASIC', '8902', '1982-11-16');

