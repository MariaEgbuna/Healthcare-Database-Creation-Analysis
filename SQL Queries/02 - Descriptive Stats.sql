-- ==================
-- PATIENTS TABLE
-- ==================

-- Number of patients
SELECT COUNT(DISTINCT p.patient_id) AS number_of_patients
FROM patients AS p;

-- Gender Distribution
SELECT 
    p.gender, 
    COUNT(p.gender) AS gender_count, 
    ROUND( (COUNT(p.gender) * 100.0 / SUM(COUNT(p.gender)) OVER ()), 2) AS gender_percentage
FROM patients AS p 
GROUP BY p.gender;

-- Dispersion (How spread out the data is)
SELECT 
    MIN(p.age) AS youngest_patient, 
    MAX(p.age) AS oldest_patient,
    ROUND(STDDEV(p.age), 2) AS std_dev,
    ROUND(VAR_POP(p.age), 2) AS var_age
FROM patients AS p;

-- Age Distribution
SELECT 
    p.age_group, 
    COUNT(p.patient_id) AS number_of_patients,
    ROUND( (COUNT(p.patient_id) * 100.0 / SUM(COUNT(p.patient_id)) OVER ()), 2) AS age_group_dist
FROM patients AS p
GROUP BY p.age_group
ORDER BY age_group ASC;

-- ===============
-- DOCTORS TABLE
-- ===============

-- Number of doctors
SELECT COUNT(DISTINCT d.doctor_id) AS number_of_doctors
FROM doctors AS d;

-- ===============
-- HOSPITALS TABLE
-- ===============

-- Number of hospitals
SELECT COUNT(DISTINCT h.hospital_id) AS hospital_count
FROM hospitals AS h;

-- ===============
-- ADMISSIONS TABLE
-- ===============

-- Total Revenue
SELECT ROUND(SUM(a.billing_amount), 2) AS total_revenue
FROM admissions AS a;

-- Number of patients admitted yearly
SELECT
    EXTRACT (YEAR FROM a.date_of_admission) AS years,
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 1 THEN a.patient_id END) AS "Jan",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 2 THEN a.patient_id END) AS "Feb",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 3 THEN a.patient_id END) AS "Mar",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 4 THEN a.patient_id END) AS "Apr",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 5 THEN a.patient_id END) AS "May",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 6 THEN a.patient_id END) AS "Jun",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 7 THEN a.patient_id END) AS "Jul",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 8 THEN a.patient_id END) AS "Aug",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 9 THEN a.patient_id END) AS "Sep",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 10 THEN a.patient_id END) AS "Oct",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 11 THEN a.patient_id END) AS "Nov",
--    COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM a.date_of_admission) = 12 THEN a.patient_id END) AS "Dec",
    COUNT(a.patient_id) AS number_of_patients
FROM admissions AS a
GROUP BY EXTRACT (YEAR FROM a.date_of_admission)
ORDER BY EXTRACT (YEAR FROM a.date_of_admission) ASC;

