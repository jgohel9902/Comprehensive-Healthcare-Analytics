USE HealthCareManagementSystem;
/* cleaning and transforming data of Patient table*/
SELECT *
FROM Patient
WHERE Email IS NULL;

SELECT *
FROM Patient
WHERE FirstName IS NULL;

SELECT *
FROM Patient
WHERE LastName IS NULL;

WITH CTE AS (SELECT PatientID, FirstName, LastName, Email,
ROW_NUMBER() OVER (PARTITION BY PatientID ORDER BY PatientID) AS RowNum 
FROM Patient
)
DELETE FROM CTE WHERE RowNum > 1;

UPDATE Patient
SET Email = LOWER(Email)
WHERE Email IS NOT NULL;

/* cleaning data of Appointment Table*/
SELECT * 
FROM Appointment
WHERE Date IS NULL OR Time IS NULL OR PatientID IS NULL OR DoctorID IS NULL;

WITH CTE AS (
    SELECT AppointmentID, Date, Time, PatientID, DoctorID,
           ROW_NUMBER() OVER (PARTITION BY AppointmentID ORDER BY AppointmentID) AS RowNum
    FROM Appointment
)
DELETE FROM CTE WHERE RowNum > 1;


/* cleaning data for Doctor Table*/
SELECT * FROM Doctor WHERE DoctorName IS NULL OR Specialization IS NULL OR DoctorContact IS NULL;

WITH CTE AS (
    SELECT DoctorID, DoctorName, Specialization, DoctorContact,
           ROW_NUMBER() OVER (PARTITION BY DoctorID ORDER BY DoctorID) AS RowNum
    FROM Doctor
)
DELETE FROM CTE WHERE RowNum > 1;

-- Checking for missing or NULL values in MedicalProcedure table
SELECT * FROM MedicalProcedure WHERE ProcedureName IS NULL OR AppointmentID IS NULL;

WITH CTE AS (
    SELECT ProcedureID, ProcedureName, AppointmentID,
           ROW_NUMBER() OVER (PARTITION BY ProcedureID ORDER BY ProcedureID) AS RowNum
    FROM MedicalProcedure
)
DELETE FROM CTE WHERE RowNum > 1;

-- Checking for missing or NULL values in Billing table
SELECT * FROM Billing WHERE InvoiceID IS NULL OR PatientID IS NULL OR Items IS NULL OR Amount IS NULL;

-- Converting Amount to a numeric type if it's stored as text
UPDATE Billing
SET Amount = CAST(Amount AS DECIMAL(10, 2))
WHERE ISNUMERIC(Amount) = 0;

WITH CTE AS (
    SELECT InvoiceID, PatientID, Items, Amount,
           ROW_NUMBER() OVER (PARTITION BY InvoiceID ORDER BY InvoiceID) AS RowNum
    FROM Billing
)
DELETE FROM CTE WHERE RowNum > 1;

/* list of all appointmnets with patient and doctor details*/
SELECT p.FirstName AS PatientFirstName, p.LastName AS PatientLastName, d.DoctorName, a.Date, a.Time
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN DOCTOR d ON a.DoctorID = d.DoctorID;

/* getting number of procedures per patient*/
SELECT p.FirstName, p.LastName, COUNT(mp.ProcedureID) AS NumberOfProcedure
FROM Patient p
JOIN Appointment a ON p.PatientID = a.PatientID
JOIN MedicalProcedure mp ON a.AppointmentID = mp.AppointmentID
GROUP BY p.PatientID, p.FirstName, p.LastName;