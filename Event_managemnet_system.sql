--Group-8 Database Implementation:

select * from shows
--SQL DDL statements:
USE Group_8

-- Creating the 'organization_role' table
CREATE TABLE organization_role (
    organizationrole_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(50)
);

-- Creating the 'organizers' table
CREATE TABLE organizers (
    organizer_id INT NOT NULL PRIMARY KEY,
    organizer_name VARCHAR(50),
    organizer_details VARCHAR(50)
);

-- Creating the 'event_type' table
CREATE TABLE event_type (
    eventtype_id INT NOT NULL PRIMARY KEY,
    type_name VARCHAR(50)
);

-- Creating the 'events' table
CREATE TABLE events (
    event_id INT NOT NULL PRIMARY KEY,
    event_name VARCHAR(50),
    event_type_id INT,
    event_location VARCHAR(50),
    event_description VARCHAR(50),
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (event_type_id) REFERENCES event_type(eventtype_id)
);

-- Creating the 'is_partners' table
CREATE TABLE is_partners (
    ispartner_id INT NOT NULL  PRIMARY KEY,
    event_id INT,
    organizer_id INT,
    organizer_role_id INT,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
    FOREIGN KEY (organizer_role_id) REFERENCES organization_role(organizationrole_id)
);

-- Creating the 'equipment_type' table
CREATE TABLE equipment_type (
  equipmenttype_id INT PRIMARY KEY IDENTITY(1,1),
  type_name VARCHAR(255)
);
 
-- Creating the 'equipment' table
CREATE TABLE equipment (
  equipment_id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(255),
  equipment_type_id INT,
  available BIT, -- BIT is used for boolean values in SQL Server
  FOREIGN KEY (equipment_type_id) REFERENCES equipment_type(equipmenttype_id)
);
 
-- Creating the 'required' table
CREATE TABLE required (
  required_id INT PRIMARY KEY IDENTITY(1,1),
  show_id INT,
  equipment_id INT,
  quantity INT,
  cost_planned DECIMAL(10, 2),
  cost_actual DECIMAL(10, 2),
  FOREIGN KEY (show_id) REFERENCES shows(show_id),
  FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

-- Creating the 'shows' table
CREATE TABLE shows (
  show_id INT PRIMARY KEY IDENTITY(1,1),
  show_name VARCHAR(255),
  show_location VARCHAR(255),
  show_description TEXT,
  start_time DATETIME,
  end_time DATETIME,
  event_id INT 
);

-- Creating the 'participants' table
CREATE TABLE participants (
  participant_id INT PRIMARY KEY IDENTITY(1,1),
  show_id INT,
  performer_id INT,
  start_time DATETIME,
  end_time DATETIME,
  cost_planned DECIMAL(10, 2),
  cost_actual DECIMAL(10, 2),
  FOREIGN KEY (show_id) REFERENCES shows(show_id),
  FOREIGN KEY (performer_id) REFERENCES performers(performer_id)
);

-- Creating the 'performers' table
CREATE TABLE performers (
  performer_id INT PRIMARY KEY IDENTITY(1,1),
  full_name VARCHAR(255),
  genre VARCHAR(255),
  contact_details TEXT
);

-- Creating the 'roles' table
CREATE TABLE roles (
    roles_id INT PRIMARY KEY,
    roles_name VARCHAR(255) NOT NULL
);

-- Creating the 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Creating the 'has_role' table
CREATE TABLE has_role (
    hasrole_id INT PRIMARY KEY,
    employee_id INT,
    roles_id INT,
    start_time DATETIME,
    end_time DATETIME
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (roles_id) REFERENCES roles(roles_id)
);

-- Creating the 'Engaged' table
CREATE TABLE Engaged (
    engaged_id INT PRIMARY KEY,
    show_id INT,
    hasrole_id INT,
    start_time DATETIME,
    end_time DATETIME,
    cost_planned DECIMAL(10, 2),
    cost_actual DECIMAL(10, 2),
    FOREIGN KEY (show_id) REFERENCES shows(show_id),
    FOREIGN KEY (hasrole_id) REFERENCES has_role(hasrole_id)
);

--SQL Insert Statements

-- Insert data into event_type table
INSERT INTO event_type (eventtype_id, type_name) VALUES
(1, 'Conference'),
(2, 'Seminar'),
(3, 'Workshop'),
(4, 'Exhibition'),
(5, 'Networking'),
(6, 'Meetup'),
(7, 'Product Launch'),
(8, 'Panel Discussion'),
(9, 'Hackathon'),
(10, 'Training');

-- Insert data into events table
INSERT INTO events (event_id, event_name, event_type_id, event_location, event_description, start_time, end_time) VALUES
(1, 'Conference A', 1, 'Conference Center 1', 'Annual technology conference', '2023-12-01 09:00:00', '2023-12-01 17:00:00'),
(2, 'Workshop B', 3, 'Workshop Hall 3', 'Hands-on coding workshop for beginners', '2023-12-02 10:30:00', '2023-12-02 15:30:00'),
(3, 'Seminar X', 2, 'Seminar Room 2', 'Industry trends and future predictions', '2023-12-03 14:00:00', '2023-12-03 17:00:00'),
(4, 'Tech Expo', 1, 'Exhibition Hall A', 'Showcasing the latest technology innovations', '2023-12-04 09:00:00', '2023-12-04 18:00:00'),
(5, 'Networking Event', 2, 'Networking Lounge', 'Opportunity to connect with professionals', '2023-12-05 18:30:00', '2023-12-05 21:00:00'),
(6, 'Community Meetup', 3, 'Community Center', 'Gathering for like-minded individuals', '2023-12-06 19:00:00', '2023-12-06 21:30:00'),
(7, 'Product Launch', 1, 'Event Hall 1', 'Unveiling the latest product line', '2023-12-07 11:00:00', '2023-12-07 13:00:00'),
(8, 'Panel Discussion', 2, 'Panel Room B', 'Exploring industry challenges and solutions', '2023-12-08 15:00:00', '2023-12-08 17:00:00'),
(9, 'Hackathon', 3, 'Hackathon Arena', '24-hour coding competition', '2023-12-09 12:00:00', '2023-12-10 12:00:00'),
(10, 'Training Session', 2, 'Training Room 4', 'Advanced training on emerging technologies', '2023-12-11 09:30:00', '2023-12-11 16:30:00');

-- Insert data into required
INSERT INTO required (show_id, equipment_id, quantity, cost_planned, cost_actual) VALUES
(1, 1, 5, 300.00, 280.00),
(1, 2, 10, 150.00, 140.00),
(2, 3, 8, 200.00, 180.00),
(2, 1, 15, 450.00, 420.00),
(3, 2, 5, 125.00, 110.00),
(3, 3, 12, 300.00, 280.00),
(4, 1, 7, 210.00, 190.00),
(4, 2, 20, 1000.00, 950.00),
(5, 3, 10, 250.00, 230.00),
(5, 1, 8, 240.00, 220.00);

-- Insert data into equipment_type
INSERT INTO equipment_type (type_name) VALUES
('Lighting'),
('Sound'),
('Stage'),
('Camera'),
('Microphone'),
('Projector'),
('Backdrop'),
('Props'),
('Monitor'),
('Cables');

--Insert into equipment
INSERT INTO equipment (name, equipment_type_id, available) VALUES
('LED Spotlight', 1, 1),
('Microphone', 2, 1),
('Stage Mixer', 2, 1),
('Wireless Microphone Set', 2, 1),
('HD Projector', 3, 1),
('Boom Arm Stand', 2, 1),
('DJ Turntable', 2, 1),
('Green Screen', 3, 1),
('Stage Lights Set', 1, 1),
('CCTV Camera', 4, 1);

--Insert into performers
INSERT INTO performers (full_name, genre, contact_details) VALUES
('John Doe', 'Comedian', 'johndoe@email.com'),
('Jane Smith', 'Magician', 'janesmith@email.com'),
('Sam Adams', 'Gymnast', 'SamAdams@email.com'),
('Jan Smith', 'Violinist', 'JanSmith@email.com'),
('Jill Dzousa', 'Painter', 'JillDzousa@emila.com'),
('Kruthi Hegde', 'Dancer', 'KruthiHegde@email.com'),
('Swarai Patil', 'Singer', 'SwaraiPatil@email.com'),
('Ashutosh Raval', 'Cartoonist', 'AshutoshRaval@email.com'),
('Shyam Ram', 'Speaker', 'ShyamRam@email.com'),
('Kane Williamson', 'Vocalist', 'KaneWilliamson@email.com');

--Insert Data into Shows
INSERT INTO shows (show_name, show_location, show_description, start_time, end_time, event_id) VALUES
('Comedy Night', 'Auditorium A', 'A night full of laughter and joy.', '2023-12-01T19:00:00', '2023-12-01T21:00:00', 1),
('Magic Show', 'Auditorium B', 'An evening of magic and wonder.', '2023-12-02T18:00:00', '2023-12-02T20:00:00', 2),
('Music Concert', 'Concert Hall', 'A night filled with melodies and rhythm.', '2023-12-03T19:00:00', '2023-12-03T21:00:00', 3),
('Dance Performance', 'Dance Studio', 'An electrifying showcase of dance forms.', '2023-12-04T18:00:00', '2023-12-04T20:00:00', 4),
('Art Exhibition', 'Art Gallery', 'A display of artistic creativity.', '2023-12-05T19:00:00', '2023-12-05T21:00:00', 5),
('Theater Play', 'Theater Hall', 'An immersive theatrical experience.', '2023-12-06T18:00:00', '2023-12-06T20:00:00', 6),
('Stand-up Comedy', 'Comedy Club', 'Laughs and entertainment galore.', '2023-12-07T19:00:00', '2023-12-07T21:00:00', 7),
('Poetry Slam', 'Coffee House', 'Words woven into captivating verses.', '2023-12-08T18:00:00', '2023-12-08T20:00:00', 8),
('Film Screening', 'Cinema Hall', 'An exclusive screening of indie films.', '2023-12-09T19:00:00', '2023-12-09T21:00:00', 9),
('Fashion Show', 'Fashion Arena', 'A showcase of style and creativity.', '2023-12-10T18:00:00', '2023-12-10T20:00:00', 10);


--Insert Data into Participants
 INSERT INTO participants (show_id, performer_id, start_time, end_time, cost_planned, cost_actual) VALUES
(1, 1, '2023-12-01T19:00:00', '2023-12-01T21:00:00', 500.00, 450.00),
(2, 3, '2023-12-02T18:00:00', '2023-12-02T20:00:00', 700.00, 650.00),
(3, 3, '2023-12-03T19:00:00', '2023-12-03T21:00:00', 600.00, 550.00),
(4, 1, '2023-12-04T18:00:00', '2023-12-04T20:00:00', 800.00, 750.00),
(5, 5, '2023-12-05T19:00:00', '2023-12-05T21:00:00', 550.00, 500.00),
(6, 9, '2023-12-06T18:00:00', '2023-12-06T20:00:00', 900.00, 850.00),
(7, 2, '2023-12-07T19:00:00', '2023-12-07T21:00:00', 750.00, 700.00),
(8, 3, '2023-12-08T18:00:00', '2023-12-08T20:00:00', 650.00, 600.00),
(9, 8, '2023-12-09T19:00:00', '2023-12-09T21:00:00', 700.00, 650.00),
(10, 10, '2023-12-10T18:00:00', '2023-12-10T20:00:00', 850.00, 800.00);
 

--Insert Data into Roles
INSERT INTO Roles (roles_id, roles_name)
VALUES
    (1, 'Event Organizer'),
    (2, 'Performer'),
    (3, 'Caterer'),
    (4, 'Security'),
    (5, 'Photographer'),
    (6, 'Speaker'),
    (7, 'AV Technician'),
    (8, 'Transportation Coordinator'),
    (9, 'Registration Staff'),
    (10, 'Cleanup Crew');


--Insert Data into Engaged
INSERT INTO Engaged (engaged_id, show_id, hasrole_id, start_time, end_time, cost_planned, cost_actual)
VALUES
    (1, 10, 1, '10:00:00', '15:00:00', 1500.00, 1200.00),
    (2, 6, 2, '13:00:00', '18:00:00', 2000.00, 1800.00),
    (3, 5, 3, '09:30:00', '14:30:00', 1200.00, 1100.00),
    (4, 7, 4, '11:00:00', '16:00:00', 1800.00, 1600.00),
    (5, 9, 5, '15:00:00', '20:00:00', 2500.00, 2300.00),
    (6, 2, 6, '14:30:00', '19:30:00', 1700.00, 1500.00),
    (7, 8, 7, '08:00:00', '13:00:00', 1400.00, 1300.00),
    (8, 1, 8, '12:30:00', '17:30:00', 2100.00, 2000.00),
    (9, 3, 9, '10:00:00', '15:00:00', 1600.00, 1500.00),
    (10, 4, 10, '09:00:00', '14:00:00', 1900.00, 1800.00);


--Insert Data into Employees
INSERT INTO Employees (employee_id, first_name, last_name)
VALUES
    (1, 'Eric', 'Doe'),
    (2, 'Alice', 'Smith'),
    (3, 'Bob', 'Johnson'),
    (4, 'Emily', 'Williams'),
    (5, 'David', 'Clark'),
    (6, 'Sarah', 'Taylor'),
    (7, 'Michael', 'Miller'),
    (8, 'Emma', 'Brown'),
    (9, 'James', 'Davis'),
    (10, 'Olivia', 'Anderson');

--Insert Data into has_role
INSERT INTO has_role (hasrole_id, employee_id, roles_id, start_time, end_time)
VALUES
    (1, 10, 1, '08:00:00', '12:00:00'),
    (2, 8, 2, '10:00:00', '16:00:00'),
    (3, 9, 3, '09:30:00', '15:30:00'),
    (4, 6, 4, '12:00:00', '18:00:00'),
    (5, 7, 5, '13:30:00', '17:30:00'),
    (6, 4, 6, '14:00:00', '20:00:00'),
    (7, 5, 7, '11:00:00', '17:00:00'),
    (8, 2, 8, '08:30:00', '14:30:00'),
    (9, 3, 9, '15:30:00', '19:30:00'),
    (10, 1, 10, '16:00:00', '22:00:00');

--Table Views:
--View 1
SELECT * FROM organizers;
SELECT * FROM event_type;
SELECT * FROM is_partners;
GO
CREATE VIEW upcoming_events_view AS
SELECT event_id, event_name, event_location, event_description, start_time, end_time
FROM events
WHERE start_time > CURRENT_TIMESTAMP;
GO

SELECT * FROM upcoming_events_view;
 
 -- View 2
-- Create a view that combines information from events, event_type, and is_partners
GO
CREATE VIEW event_details_view AS
SELECT
   e.event_id,
   e.event_name,
   et.type_name AS event_type,
   e.event_location,
   e.event_description,
   e.start_time,
   e.end_time,
   o.organizer_name AS partner_organizer,
   orl.role_name AS organizer_role
FROM
   events e
JOIN
   event_type et ON e.event_type_id = et.eventtype_id
LEFT JOIN
   is_partners ip ON e.event_id = ip.event_id
LEFT JOIN
   organizers o ON ip.organizer_id = o.organizer_id
LEFT JOIN
   organization_role orl ON ip.organizer_role_id = orl.organizationrole_id;
GO

-- Query the event_details_view
SELECT * FROM event_details_view;


-- View 3: Shows with Event Details
GO
CREATE VIEW vw_shows_with_events AS
SELECT
    s.show_id,
    s.show_name,
    s.show_location,
    s.show_description,
    s.start_time,
    s.end_time,
    e.event_name,
    e.event_description
FROM
    shows s
JOIN
    events e ON s.event_id = e.event_id;
GO

-- Query the vw_shows_with_events 
SELECT * FROM vw_shows_with_events;


-- TABLE LEVEL CHECK
-- Create a user-defined function for start time < end time check
GO
CREATE FUNCTION dbo.CheckStartBeforeEnd(@start_time DATETIME, @end_time DATETIME)
RETURNS BIT
AS
BEGIN
   RETURN CASE WHEN @start_time < @end_time THEN 1 ELSE 0 END;
END;
GO
-- Alter the events table to add a CHECK constraint based on a user-defined function
ALTER TABLE events
ADD CONSTRAINT chk_start_before_end
CHECK (dbo.CheckStartBeforeEnd(start_time, end_time) = 1);

-- Test inserting data that violates the CHECK constraint
INSERT INTO events (event_id, event_name, event_type_id, event_location, event_description, start_time, end_time)
VALUES
   (101, 'Test Event', 1, 'Test Location', 'Test Description', '2023-12-15 12:00:00', '2023-12-15 10:00:00');


--Check constraint for Cost planned and Cost Actual
GO
CREATE FUNCTION dbo.fn_Check_Cost_Planned_Less_Than_Actual (@planned DECIMAL(10, 2), @actual DECIMAL(10, 2))
RETURNS BIT
AS
BEGIN
    RETURN CASE WHEN @planned <= @actual THEN 1 ELSE 0 END;
END;
GO

--Add the CHECK constraint with the function
ALTER TABLE required
ADD CONSTRAINT CK_Cost_Planned_Less_Than_Actual
CHECK (dbo.fn_Check_Cost_Planned_Less_Than_Actual(cost_planned, cost_actual) = 1);

--Column Data Encryption:

-- Step 1: Create a Master Key
--The master key is a symmetric key used to protect the private keys of certificates and asymmetric keys stored in the database.

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Grp_8_Column_Encryption';


--Step2 :
CREATE CERTIFICATE MyCertificate WITH SUBJECT = 'Column Encryption';


-- Step 3: Create a Symmetric Key
--The symmetric key is what will actually be used to encrypt and decrypt the data in the column.

CREATE SYMMETRIC KEY MySymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MyCertificate;


-- Step 4: Add Columns for Encrypted Data
ALTER TABLE organizers ADD organizer_details_encrypted VARBINARY(MAX);
ALTER TABLE events ADD event_description_encrypted VARBINARY(MAX);
ALTER TABLE employees ADD full_name VARCHAR(255);
UPDATE employees SET full_name = CONCAT(first_name, ' ', last_name);
ALTER TABLE employees ADD encrypted_full_name VARBINARY(MAX);
ALTER TABLE performers ADD contact_details_encrypted varbinary(max);

-- Step 5: Encrypt the Data
OPEN SYMMETRIC KEY MySymmetricKey
DECRYPTION BY CERTIFICATE MyCertificate;

UPDATE organizers
SET organizer_details_encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), organizer_details);

UPDATE events
SET event_description_encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), event_description);

UPDATE performers
SET contact_details_encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), CONVERT(varchar(max), contact_details));

UPDATE employees
SET encrypted_full_name = ENCRYPTBYPASSPHRASE('your_secret_key', full_name);

CLOSE SYMMETRIC KEY MySymmetricKey;

/*
 * Decryption
 */

OPEN SYMMETRIC KEY MySymmetricKey
DECRYPTION BY CERTIFICATE MyCertificate;
-- Selecting and decrypting data from the organizers table
SELECT organizer_id, organizer_name, 
       CONVERT(VARCHAR(MAX), DecryptByKey(organizer_details_encrypted)) AS organizer_details_decrypted
FROM organizers;
-- Selecting and decrypting data from the events table
SELECT event_id, event_name,
       CONVERT(VARCHAR(MAX), DecryptByKey(event_description_encrypted)) AS event_description_decrypted
FROM events;
CLOSE SYMMETRIC KEY MySymmetricKey;

OPEN SYMMETRIC KEY MySymmetricKey
DECRYPTION BY CERTIFICATE MyCertificate;
-- Selecting and decrypting data from the organizers table
SELECT full_name,
           CONVERT(VARCHAR(MAX), DecryptByKey(contact_details_encrypted)) AS contact_details_encrypted
FROM performers;
CLOSE SYMMETRIC KEY MySymmetricKey;

SELECT DECRYPTBYPASSPHRASE('your_secret_key', encrypted_full_name) as decrypted_full_name
FROM employees;