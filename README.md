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

## Descriptive Statistics

* Date Range: May 2019 - May 2024
* Total Billing Amount/ Revenue : $1.42bn
* Number of Doctors : 40341
* Number of Hospitals : 10

### Patients Data

* Number of Patients : 55,000

|Years|Admitted Patients|
|-----|------------------|
|2019|7387|
|2020|11285|
|2021|10931|
|2022|11017|
|2023|11026|
|2024|3854|

* Gender Distribution

|Gender|Gender %|
|------|-----------------|
|Male|40.00|
|Non-binary|10.00|
|Female|50.00|

* Age Groups

|Age Groups|Number of Patients|Age Groups %|
|---------|------------------|--------------|
|13-17 (Teens)|116|0.21|
|18-30 (Young Adult)|10383|18.71|
|31-45 (Mid Adult)|12230|22.04|
|46-60 (Mature Adult)|12401|22.34|
|Above 60 (Senior)|20370|36.70|

---

## Exploratory Data Analysis

**Author Name**: *Maria Egbuna*     
**Project**: *ONYX Healthcare Analysis*    
**Liscence**: *MIT Liscence*    
**Date**: *2025-10-13*
