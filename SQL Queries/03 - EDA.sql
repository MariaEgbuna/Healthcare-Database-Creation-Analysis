-- 1. WHAT ARE THE MOST COMMON BLOOD TYPES AMONG PATIENTS?
SELECT p.blood_type, COUNT(p.blood_type) AS frequency
FROM patients AS p
GROUP BY p.blood_type;


--2. WHICH MEDICAL CONDITIONS ARE DIAGNOSED THE MOST, AND DO THEY AFFECT CERTAIN GROUPS OF PEOPLE MORE THAN OTHERS?

-- By Genders
SELECT 
	a.medical_condition,
	COUNT(DISTINCT CASE WHEN p.gender = 'Male' THEN a.patient_id END) AS male_patients,
    COUNT(DISTINCT CASE WHEN p.gender = 'Female' THEN a.patient_id END) AS female_patients,
    COUNT(DISTINCT CASE WHEN p.gender = 'Non-binary' THEN a.patient_id END) AS non_binary_patients,
	COUNT(DISTINCT a.patient_id) AS total_count
FROM admissions AS a
JOIN patients AS p
ON a.patient_id = p.patient_id
GROUP BY a.medical_condition;

-- By Age Groups
SELECT 
	a.medical_condition,
	COUNT(DISTINCT CASE WHEN p.age_group = '13-17 (Teens)' THEN a.patient_id END) AS teens,
    COUNT(DISTINCT CASE WHEN p.age_group = '18-30 (Young Adult)' THEN a.patient_id END) AS young_adults,
    COUNT(DISTINCT CASE WHEN p.age_group = '31-45 (Mid Adult)' THEN a.patient_id END) AS mid_adults,
    COUNT(DISTINCT CASE WHEN p.age_group = '46-60 (Mature Adult)' THEN a.patient_id END) AS mature_adults,
    COUNT(DISTINCT CASE WHEN p.age_group = 'Above 60 (Senior)' THEN a.patient_id END) AS seniors,
	COUNT(DISTINCT a.patient_id) AS total_count
FROM admissions AS a
JOIN patients AS p
ON a.patient_id = p.patient_id
GROUP BY a.medical_condition;

-- 3. HOW LONG DO PATIENTS TYPICALLY STAY IN THE HOSPITAL FOR DIFFERENT CONDITIONS? DOES THIS VARY DEPENDING ON THE HOSPITAL OR TYPE OF ADMISSION (EMERGENCY, URGENT, OR ELECTIVE)?
-- Medical Conditions Avg Stay
SELECT 
	a.medical_condition, 
	AVG(a.discharge_date - a.date_of_admission) AS avg_length_of_stay
FROM admissions AS a
WHERE a.discharge_date IS NOT NULL
GROUP BY a.medical_condition;
-- Type of admission
SELECT 
	a.medical_condition,
	AVG(CASE
        WHEN a.admission_type = 'Emergency' THEN (a.discharge_date - a.date_of_admission)
        ELSE NULL
    END) AS avg_stay_emergency,
	AVG(CASE
        WHEN a.admission_type = 'Urgent' THEN (a.discharge_date - a.date_of_admission)
        ELSE NULL
    END) AS avg_stay_urgent,
    AVG(CASE
        WHEN a.admission_type = 'Elective' THEN (a.discharge_date - a.date_of_admission)
        ELSE NULL
    END) AS avg_stay_elective
FROM admissions AS a
WHERE a.discharge_date IS NOT NULL
GROUP BY a.medical_condition;
-- By hospitals
SELECT 
	h.hospital_name, 
	AVG(a.discharge_date - a.date_of_admission) AS avg_length_of_stay
FROM admissions AS a
JOIN hospitals AS h
ON a.hospital_id = h.hospital_id
WHERE a.discharge_date IS NOT NULL
GROUP BY h.hospital_name;

-- 4. HOW MUCH DOES TREATMENT USUALLY COST FOR EACH CONDITION? ARE THERE BIG DIFFERENCES IN COSTS BETWEEN HOSPITALS OR INSURANCE PROVIDERS?
-- Medical Conditions
SELECT a.medical_condition, AVG(a.billing_amount) AS avg_bill
FROM admissions AS a
GROUP BY a.medical_condition;
-- Hospitals
SELECT h.hospital_name, AVG(a.billing_amount) AS avg_bill
FROM admissions AS a
JOIN hospitals AS h
ON a.hospital_id = h.hospital_id
GROUP BY h.hospital_name;
-- Insurance Providers
SELECT ip.insurance_name, AVG(a.billing_amount) AS avg_bill
FROM admissions AS a
JOIN insurance_providers AS ip
ON a.insurance_id = ip.insurance_id
GROUP  BY ip.insurance_name;

-- 5. WHICH HOSPITALS ARE TREATING THE MOST PATIENTS, AND HOW DO THEY COMPARE IN TERMS OF PATIENT OUTCOMES, LIKE TEST RESULTS?
SELECT 
	h.hospital_name, 
	COUNT(a.patient_id) AS number_of_patients,
	COUNT(DISTINCT CASE WHEN a.test_results = 'Abnormal' THEN a.patient_id END) AS abnormal_results,
	COUNT(DISTINCT CASE WHEN a.test_results = 'Normal' THEN a.patient_id END) AS normal_results,
	COUNT(DISTINCT CASE WHEN a.test_results = 'Inconclusive' THEN a.patient_id END) AS inconclusive_results
FROM admissions AS a
JOIN hospitals AS h
ON a.hospital_id = h.hospital_id
GROUP BY h.hospital_name;
