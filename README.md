# 🏥 ONYX Healthcare Project

## Goal

* To uncover insights that can drive better healthcare decisions, optimize costs, and improve patient outcomes.
* Create a compelling Power BI dashboard that tells the story of patient care across hospitals, identifies trends, and helps stakeholders make data-informed decisions.

## Initial Data Acquisition and Source

The source data was a single, comprehensive flat file containing a wide variety of information, including:

* Patient demographics
* Doctor and hospital details
* Insurance and coverage information
* Admission/Discharge dates
* Test results and treatments

**Source:** Onyx Data – Power BI Challenge

---

## Data Segmentation via Power Query

The critical first step was moving from a flat, redundant structure to an organized, normalized one. This was achieved by using **Power Query** to segment the original dataset based on the core entities.

| Entity | Description |
| :--- | :--- |
| **Patients** | Unique patient demographics (Name, Age, Blood type, etc.) |
| **Doctors** | Unique physician details (Doctor Id, Name) |
| **Hospitals** | Unique facility information (Name, Location) |
| **Insurance Providers** | Unique carrier details (Name) |
| **Admissions** | The core transaction data (Date In/Out, Test Results, etc.) |

**Result:** Five smaller, focused CSV files were created, each representing a primary entity in the healthcare system.

---

## Data Cleaning and Validation

* **No Null Values:** All required fields across all tables were populated.
* **No Duplicate Records:** All primary keys and identity-critical fields were unique.
* **Format Standardization:** All date and time fields were converted to a consistent SQL standard (`YYYY-MM-DD`).

---

## E-R-Diagram

![The Entity Relationship Diagram](<Images/HealthCare Database Schema.png>)

---

**Author Name**: *Maria Egbuna*     
**Project**: *ONYX Healthcare Analysis*    
**Liscence**: *MIT Liscence*    
**Date**: *2025-10-13*
