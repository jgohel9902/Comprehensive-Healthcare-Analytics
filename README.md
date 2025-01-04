# Comprehensive Healthcare Analytics Project

This project demonstrates an end-to-end data analysis and visualization workflow for healthcare data using **SQL**, **Python**, **Power BI**, and **Pandas**. The analysis focuses on understanding patient trends, billing insights, and doctor performance while showcasing advanced data cleaning, transformation, and visualization techniques.

## Objective
The goal of this project is to analyze healthcare data to provide actionable insights for stakeholders, including billing trends, doctor performance, and patient demographics, using:
- SQL for data cleaning and transformation.
- Python for advanced data manipulation.
- Power BI for interactive visualizations.

## Tech Stack
- **SQL Server Management Studio (SSMS):** Data cleaning and transformation.
- **Python (Pandas, Matplotlib, Seaborn):** Data analysis and preparation.
- **Power BI:** Data visualization and dashboard creation.
- **GitHub:** Version control and project repository.

## Dataset Description
The project uses healthcare data consisting of multiple CSV files:

1. **Patient.csv**
   - `PatientID`, `FirstName`, `LastName`, `Email`

2. **Doctor.csv**
   - `DoctorID`, `DoctorName`, `Specialization`, `DoctorContact`

3. **Billing.csv**
   - `InvoiceID`, `PatientID`, `Items`, `Amount`

4. **Appointment.csv**
   - `AppointmentID`, `Date`, `Time`, `PatientID`, `DoctorID`


## Data Preparation

### SQL Data Cleaning
- Removed duplicates from the `Billing` and `Appointment` tables.
- Ensured `PatientID` and `DoctorID` integrity across tables.
- Standardized missing values using `NULL` or defaults.

### Python Data Analysis
- Loaded cleaned data using Pandas.
- Performed exploratory data analysis (EDA) on billing and appointments.
- Generated Python visualizations for preliminary insights.

### Power BI Dataset
- Imported the cleaned datasets into Power BI.
- Established relationships between tables using primary and foreign keys.


## How to Run the Project

1. **SQL Server:**
   - Import all datasets into SQL Server.
   - Run the provided SQL scripts for data cleaning.

2. **Python Scripts:**
   - Use `dataanalysis.py` to perform additional data preprocessing.
   - Ensure all dependencies are installed (`pandas`, `matplotlib`, `seaborn`).

3. **Power BI:**
   - Load the cleaned datasets.
   - Recreate the relationships and visualizations as described.

4. **GitHub:**
   - Clone the repository and access all necessary files [here](#).

---

## Key Insights
- **Revenue Trends:** Consistent growth in monthly billing revenue.
- **Doctor Analysis:** Specializations like Cardiology generated higher revenue.
- **Patient Behavior:** Certain patients showed repeat visits, driving revenue.

---

## Future Scope
- Integrate predictive analytics to forecast appointment trends.
- Use advanced Power BI features like drill-through and what-if analysis.
- Expand datasets to include more demographic details for patients.

---

## Repository
Find the complete project on GitHub: [Healthcare Analytics Project](#)
