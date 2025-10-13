# 🏥 Healthcare Database Project Documentation

This repository documents the process of transforming a large, complex healthcare dataset into a structured, relational database for efficient analysis and reporting.

## 1. Initial Data Acquisition and Source

The source data was a single, comprehensive flat file (e.g., a large CSV or Excel file) containing a wide variety of information, including:

* Patient demographics
* Doctor and hospital details
* Insurance and coverage information
* Admission/Discharge dates
* Test results and treatments

The dataset captures a broad view of hospital admissions, medical conditions, medications, insurance providers, and treatment costs.

---

## 2. Data Segmentation via Power Query

The critical first step was moving from a flat, redundant structure to an organized, normalized one. This was achieved by using **Power Query** to segment the original dataset based on the core entities.

| Entity | Description | Purpose in Database |
| :--- | :--- | :--- |
| **Patients** | Unique patient demographics (Name, Age, Blood type, etc.) | Stores a single, definitive record for each person. |
| **Doctors** | Unique physician details (Doctor Id, Name) | Stores a single, definitive record for each provider. |
| **Hospitals** | Unique facility information (Name, Location) | Stores a single, definitive record for each location. |
| **Insurance Providers** | Unique carrier details (Name) | Stores a single, definitive record for each payer. |
| **Admissions** | The core transaction data (Date In/Out, Test Results, etc.) | Links all other entities to a specific event (the patient visit). |

**Result:** Five smaller, focused CSV files were created, each representing a primary entity in the healthcare system.

---

## 3. Database Creation and Import

The segmented CSV files were imported into a newly created **Relational Database Management System (RDBMS)**, named `[Healthcare Database]`. Each CSV file became its own dedicated table within the database.

---

## 4. Establishing the Relational Model (Normalization)

This step was vital for defining the relationships and enforcing data integrity across the separate tables using **Primary Keys (PKs)** and **Foreign Keys (FKs)**.

### 4.1. Primary Key (PK) Definition

A unique **Primary Key** was defined for each of the entity tables to ensure every record can be uniquely identified and to serve as the target for foreign key relationships.

| Table | Primary Key (PK)|
| :--- | :--- |
| **Patients** | `patient_id` |
| **Doctors** | `doctor_id` |
| **Hospitals** | `hospital_id` |
| **Insurance Providers**| `insurance_id` |

### 4.2. Foreign Key (FK) Definition

**Foreign Keys** were implemented, primarily in the **`Admissions`** table, to link back to the entity tables. This re-establishes the connections that existed in the original flat file, allowing for powerful relational queries.

* The **`Admissions`** table now contains FKs like `patient_id`, `doctor_id`, `hospital_id`, and `insurance_id`.

---

## 5. Data Cleaning and Validation

* **No Null Values:** All required fields across all tables were populated.
* **No Duplicate Records:** All primary keys and identity-critical fields were unique.
* **Format Standardization:** All date and time fields were converted to a consistent SQL standard (`YYYY-MM-DD`).
* **Logical Constraints:** **`CHECK` constraints** were applied to enforce temporal logic (e.g., `date_of_discharge` >= `date_of_admission`)

---

## DATABASE OVERVIEW

![The Entity Relationship Diagram](<Images/HealthCare Database Schema.png>)

---

**Current Status:** The database is fully **normalized** and ready for complex SQL queries, reporting, and analytical tasks. Data redundancy has been eliminated, and data integrity is enforced by the key constraints.

---

### Next Steps

* To uncover insights that can drive better healthcare decisions, optimize costs, and improve patient outcomes.
* Create a compelling Power BI dashboard that tells the story of patient care across hospitals, identifies trends, and helps stakeholders make data-informed decisions.

---

**Author Name**: *Maria Egbuna*
**Project**: *ONYX Healthcare (Database Creation and Data Analysis)*
**Liscence**: *MIT Liscence*
**Date**: *2025-10-13*
