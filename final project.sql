

                                    -- SCHEMA
CREATE TABLE "Doners"(
    "id" INT PRIMARY KEY AUTO_INCREMENT,
    "first_name" TEXT,
    "last_name" TEXT,
    "date_of_birth" DATE,
    "gender" TEXT,
    "blood_group" TEXT,
    "contact_number" TEXT,
    "address" TEXT
);


CREATE TABLE "Recipients"(
    "id" INT PRIMARY KEY AUTO_INCREMENT,
    "first_name" TEXT,
    "last_name" TEXT,
    "date_of_birth" DATE,
    "gender" TEXT,
    "blood_group" TEXT,
    "contact_number" TEXT,
    "address" TEXT,
    "medical_issue" TEXT
);


CREATE TABLE "Blood_donations"(
    "id" INT PRIMARY KEY AUTO_INCREMENT,
    "doner_id" INT,
    "blood_group" TEXT,
    "donation_date" DATETIME DEFAULT CURRENT_TIME,
    "expiration_date" DATE,
    "deleted" INT DEFAULT 0,
    FOREIGN KEY ("doner_id") REFERENCES "Doners"("id")
);


CREATE TABLE "Blood_given"(
    "id" INT PRIMARY KEY AUTO_INCREMENT,
    "donation_id" INT,
    "date_when_blood_given" DATETIME DEFAULT CURRENT_TIME,
    "recipient_id" INT,
    FOREIGN KEY ("recipient_id") REFERENCES "Recipients"("id"),
    FOREIGN KEY ("donation_id") REFERENCES "Blood_donations"("id")
);




CREATE VIEW "Current_blood" AS
SELECT "id", "doner_id", "donation_date", "expiration_date"
FROM "Blood_donations" WHERE "deleted" = 0;


CREATE TRIGGER "delete_blood"
INSTEAD OF DELETE ON "Current_blood"
FOR EACH ROW
BEGIN
    UPDATE "Blood_donations" SET "deleted" = 1
    WHERE "id" = OLD."id";
END;


      -- we can simply add data in main table rather then using trigger.
-- CREATE TRIGGER "add_blood"
-- INSTEAD OF INSERT ON "Current_blood"
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO "Blood_donations"("id", "doner_id", "expiration_date")
--     VALUES (NEW."id", NEW."doner_id", NEW."expiration_date");
-- END;


CREATE INDEX "doners_index" ON "Doners"("blood_group");

CREATE INDEX "recipients_index" ON "Recipients"("blood_group");





















                                                       -- INSERTING VALUES

INSERT INTO "Doners" ("id", "first_name", "last_name", "date_of_birth", "gender", "blood_group", "contact_number", "address")
VALUES
(1000, 'Zulqarnain', 'Ali', '2004-06-16', 'Male', 'B+', '03069407213', 'Sargodha'),
(1001, 'John', 'Doe', '1990-05-15', 'Male', 'A+', '1234567890', '123 Main St'),
(1002, 'Jane', 'Smith', '1985-09-20', 'Female', 'O-', '9876543210', '456 Oak Ave'),
(1003, 'Michael', 'Johnson', '1982-03-10', 'Male', 'AB+', '5558889999', '789 Pine Rd'),
(1004, 'Emily', 'Brown', '1995-07-25', 'Female', 'B-', '1112223333', '321 Elm Blvd'),
(1005, 'David', 'Wilson', '1988-11-18', 'Male', 'O+', '4445556666', '555 Cedar Ln'),
(1006, 'Sarah', 'Martinez', '1992-01-30', 'Female', 'A-', '9990001111', '777 Birch Dr'),
(1007, 'Chris', 'Garcia', '1980-08-05', 'Male', 'B+', '7778889999', '888 Maple Ave'),
(1008, 'Jennifer', 'Davis', '1987-04-12', 'Female', 'AB-', '3334445555', '999 Pine St'),
(1009, 'Daniel', 'Rodriguez', '1993-06-22', 'Male', 'A+', '6667778888', '222 Oak Blvd'),
(1010, 'Lisa', 'Miller', '1984-12-07', 'Female', 'O-', '2223334444', '111 Cedar Rd');


INSERT INTO "Recipients" ("id", "first_name", "last_name", "date_of_birth", "gender", "blood_group", "contact_number", "address", "medical_issue")
VALUES
(1000, 'Umair', 'Akram', '1970-01-06', 'Male', 'B+', '0300 9407213', 'Sargodha', 'Blood Deficiency'),
(1001, 'Mark', 'Thomas', '1977-02-28', 'Male', 'A+', '5551112222', '321 Oak St', 'Blood Deficiency'),
(1002, 'Michelle', 'Lee', '1965-11-10', 'Female', 'B-', '7773331111', '456 Pine Ave', 'Blood Deficiency'),
(1003, 'Kevin', 'Clark', '1980-09-15', 'Male', 'AB+', '9998887777', '789 Elm Rd', 'Blood Deficiency'),
(1004, 'Amanda', 'White', '1972-03-03', 'Female', 'O+', '3336669999', '654 Maple Blvd', 'Blood Deficiency'),
(1005, 'Brian', 'Young', '1983-07-20', 'Male', 'A-', '1114447777', '987 Birch Ave', 'Blood Deficiency'),
(1006, 'Laura', 'Moore', '1979-05-08', 'Female', 'B+', '2225558888', '741 Cedar Ln', 'Blood Deficiency'),
(1007, 'Scott', 'Taylor', '1968-12-18', 'Male', 'AB-', '8882225555', '852 Oak Dr', 'Blood Deficiency'),
(1008, 'Rachel', 'Allen', '1986-08-25', 'Female', 'O-', '4447770000', '963 Elm St', 'Blood Deficiency'),
(1009, 'Justin', 'Scott', '1974-01-12', 'Male', 'A+', '6669991111', '147 Pine Ave', 'Blood Deficiency'),
(1010, 'Samantha', 'King', '1981-06-30', 'Female', 'B-', '1234567890', '369 Maple Rd', 'Blood Deficiency');


INSERT INTO "Blood_donations" ("id", "doner_id", "blood_group", "expiration_date")
VALUES
(1000, 1000, 'B+', '2024-12-31'),
(1001, 1001, 'AB+', '2024-12-31'),    ----       is me se "id" hatana, kyu ke id tto auto_increment is khud aa jaye gi
(1002, 1002, 'B+', '2024-08-15'),
(1003, 1003, 'B+', '2024-07-28'),
(1004, 1004, 'B+', '2024-08-30'),
(1005, 1005, 'B+', '2024-07-31'),
(1006, 1006, 'B+', '2023-09-31'),
(1007, 1007, 'B+', '2024-08-30'),
(1008, 1008, 'B+', '2024-09-30'),
(1009, 1009, 'B+', '2024-05-11'),
(1010, 1010, 'B+', '2024-08-31');


      -- This data will be added when blood will be given to recipients, writing the query.
-- INSERT INTO "Blood_given" ("id", "donation_id", "recipient_id")
-- VALUES
-- (1000, 1000, 1000),
-- (1001, 1001, 1001),
-- (1002, 1002, 1002),
-- (1003, 1003, 1003),
-- (1004, 1004, 1004),
-- (1005, 1005, 1005),
-- (1006, 1006, 1006),
-- (1007, 1007, 1007),
-- (1008, 1008, 1008),
-- (1009, 1009, 1009),
-- (1010, 1010, 1010);

























                    -- QUERIRES



-- ADD NEW DONER
INSERT INTO "Doners" ("first_name", "last_name", "date_of_birth", "gender", "blood_group", "contact_number", "address")
VALUES ('Zulqarnain', 'Ali', '2004-06-16', 'Male', 'B+', '03069407213', 'Sargodha');


-- ADD NEW RECIPIENT
INSERT INTO "Recipients" ("first_name", "last_name", "date_of_birth", "gender", "blood_group", "contact_number", "address", "medical_issue")
VALUES ('Umair', 'Akram', '1970-01-06', 'Male', 'B+', '03009407213', 'Sargodha', 'Blood Deficiency');



-- ADD NEW BLOOD DONATION BY SOMEONE
INSERT INTO "Blood_donations" ("doner_id", "blood_group", "expiration_date")
VALUES (1000, 'B+', '2024-12-31');



-- GIVE BLOOD TO PATIENT
BEGIN TRANSACTION;                       --(First we will delete the blood from curren_blood and then we will add this record in Blood_given)

DELETE FROM "Current_blood" WHERE "id" = 1002;
INSERT INTO "Blood_given" ("donation_id", "recipient_id")
SELECT 1001, 1002 ;

COMMIT;




-- Delete expired blood till today
DELETE FROM "Blood_donations"
WHERE "expiration_date" <= DATE('now');




-- people who donated blood more than one time
SELECT "Doners"."id", "Doners"."first_name", "Doners"."last_name", COUNT("Blood_donations"."id") AS donation_count
FROM "Doners"
JOIN "Blood_donations" ON "Doners"."id" = "Blood_donations"."doner_id"
GROUP BY "Doners"."id", "Doners"."first_name", "Doners"."last_name"
HAVING COUNT("Blood_donations"."id") > 1;



-- Calculate the total number of blood donations per blood group
SELECT "blood_group", COUNT(*) AS "total_donations"
FROM "Blood_donations"
GROUP BY "blood_group";




-- Find which doner's blood is donated to which recipient and on which date.
SELECT "Doners"."first_name", "Doners"."last_name",
       "Recipients"."first_name", "Recipients"."last_name",
       "Blood_donations"."donation_date"
FROM "Blood_donations"
JOIN "Doners" ON "Blood_donations"."doner_id" = "Doners"."id"
JOIN "Blood_given" ON "Blood_donations"."id" = "Blood_given"."donation_id"
JOIN "Recipients" ON "Blood_given"."recipient_id" = "Recipients"."id";


















-- erDiagram
--     Doners ||--o{ Blood_Donations : donate_blood
--     Blood_Donations ||--o{ Blood_Given : record_data
--     Blood_Given }|..|{ Recipients : receive_blood
--     Blood_Donations }|..|{ Recipients : give_blood
