import pandas as pd

df_patient = pd.read_csv('Patient.csv')
df_billing = pd.read_csv('Billing.csv')
df_doctor = pd.read_csv('Doctor.csv')
df_appointment = pd.read_csv('Appointment.csv')


# Converting PatientID to numeric and remove invalid entries
df_patient['PatientID'] = pd.to_numeric(df_patient['PatientID'], errors='coerce')
df_patient = df_patient.dropna(subset=['PatientID'])

# Handling missing data in Patient Data
df_patient = df_patient.fillna({'FirstName': 'Unknown', 'LastName': 'Unknown', 'Email': 'Unknown'})

# Cleaning the Billing data
df_billing['InvoiceID'] = pd.to_numeric(df_billing['InvoiceID'], errors='coerce')
df_billing['Amount'] = pd.to_numeric(df_billing['Amount'], errors='coerce')
df_billing = df_billing.dropna(subset=['InvoiceID', 'Amount'])

# Cleaning Doctor data
df_doctor['DoctorID'] = pd.to_numeric(df_doctor['DoctorID'], errors='coerce')
df_doctor = df_doctor.dropna(subset=['DoctorID'])

# Cleaning Appointment data
df_appointment['AppointmentID'] = pd.to_numeric(df_appointment['AppointmentID'], errors='coerce')
df_appointment['PatientID'] = pd.to_numeric(df_appointment['PatientID'], errors='coerce')
df_appointment['DoctorID'] = pd.to_numeric(df_appointment['DoctorID'], errors='coerce')
df_appointment = df_appointment.dropna(subset=['AppointmentID', 'PatientID', 'DoctorID'])

# Displaying cleaned data (just to see)
print("Patient Data")
print(df_patient.head())
print("\nBilling Data")
print(df_billing.head())
print("\nDoctor Data")
print(df_doctor.head())
print("\nAppointment Data")
print(df_appointment.head())

df_patient.to_csv('Cleaned_Patient.csv', index=False)
df_billing.to_csv('Cleaned_Billing.csv', index=False)
df_doctor.to_csv('Cleaned_Doctor.csv', index=False)
df_appointment.to_csv('Cleaned_Appointment.csv', index=False)
