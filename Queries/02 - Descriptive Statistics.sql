-- =========================================
-- PATIENTS TABLE: Descriptive Statistics
-- =========================================

-- AVERAGE AGE
SELECT ROUND(AVG(p.age), 2) as avg_age  -- Overall Avg Age
FROM patients as p;

-- MEDIAN AGE
SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY p.age) -- Median Age
FROM patients AS p;

-- GENDER DISTRIBUTION
SELECT 
    p.gender, 
    COUNT(P.gender) as gender_count,
    ROUND((COUNT(p.gender) * 100.0 / SUM(COUNT(p.gender)) OVER ()), 2) AS gender_percent
FROM patients as p
GROUP BY p.gender;

-- BLOOD TYPE DISTRIBUTION
SELECT 
    p.blood_type, 
    COUNT(p.blood_type) as gender_count,
    ROUND((COUNT(p.blood_type) * 100.0 / SUM(COUNT(p.blood_type)) OVER ()), 2) AS gender_percent
FROM patients as p
GROUP BY p.blood_type
ORDER BY gender_percent DESC;

-- MAXIMUM AND MINIMUM AGES
SELECT MIN(p.age) as youngest_age, MAX(p.age) as oldest_age
from patients as p;

-- NUMBER OF PATIENTS
SELECT COUNT(p.*) as total_patients --Number of patients
FROM patients as p;

-- Age Distribution by Gender
SELECT p.gender, ROUND(AVG(p.age), 2) as avg_age
FROM patients as p
GROUP BY p.gender;

-- Age Distribution by Blood type
SELECT p.blood_type, ROUND(AVG(p.age), 2) as avg_age
FROM patients as p
GROUP BY p.blood_type;