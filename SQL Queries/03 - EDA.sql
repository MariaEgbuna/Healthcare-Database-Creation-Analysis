-- 1. What are the most common age groups, genders, and blood types among patients? Are certain groups being admitted more often than others?
SELECT 
	p.age_group,
	p.gender,
    p.blood_type,
    COUNT(a.admission_id) AS total_admissions
FROM patients p
LEFT JOIN admissions a ON p.patient_id = a.patient_id
GROUP BY age_group, p.gender, p.blood_type
ORDER BY total_admissions DESC;

-- 2. Most diagnosed medical conditions and their distribution across demographic groups
SELECT
    a.medical_condition,
    p.gender,
    p.age_group,
    COUNT(a.admission_id) AS total_cases
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY a.medical_condition, p.gender, age_group
ORDER BY total_cases DESC;

-- 3. Average hospital stay duration by condition, hospital, and admission type
SELECT
    a.medical_condition,
    h.hospital_name,
    a.admission_type,
    ROUND(AVG(a.discharge_date - a.date_of_admission), 2) AS avg_length_of_stay
FROM admissions a
JOIN hospitals h ON a.hospital_id = h.hospital_id
WHERE a.discharge_date IS NOT NULL
GROUP BY a.medical_condition, h.hospital_name, a.admission_type
ORDER BY avg_length_of_stay DESC;

-- 4. Average treatment cost per condition, with comparison across hospitals and insurance providers
SELECT
    a.medical_condition,
    h.hospital_name,
    i.insurance_name,
    ROUND(AVG(a.billing_amount), 2) AS avg_treatment_cost,
    ROUND(MIN(a.billing_amount), 2) AS min_cost,
    ROUND(MAX(a.billing_amount), 2) AS max_cost
FROM admissions a
JOIN hospitals h ON a.hospital_id = h.hospital_id
JOIN insurance_providers i ON a.insurance_id = i.insurance_id
GROUP BY a.medical_condition, h.hospital_name, i.insurance_name
ORDER BY avg_treatment_cost DESC;

-- 5. Hospital performance: patient volume and outcomes comparison
SELECT
    h.hospital_name,
    COUNT(a.admission_id) AS total_patients_treated,
    COUNT(CASE WHEN a.test_results ILIKE 'Normal' THEN 1 END) AS normal_results,
    COUNT(CASE WHEN a.test_results ILIKE 'Abnormal' THEN 1 END) AS abnormal_results,
    COUNT(CASE WHEN a.test_results ILIKE 'Inconclusive' THEN 1 END) AS inconclusive_results,
    ROUND(100.0 * COUNT(CASE WHEN a.test_results ILIKE 'Normal' THEN 1 END) / COUNT(a.admission_id), 2 ) AS normal_result_percentage
FROM admissions a
JOIN hospitals h ON a.hospital_id = h.hospital_id
GROUP BY h.hospital_name
ORDER BY total_patients_treated DESC;

-- 6. Most commonly prescribed medications per condition and their consistency across hospitals
SELECT
    a.medical_condition,
    a.medication,
    h.hospital_name,
    COUNT(a.admission_id) AS prescriptions_count,
    ROUND( 100.0 * COUNT(a.admission_id) / SUM(COUNT(a.admission_id)) OVER (PARTITION BY a.medical_condition), 2 ) AS usage_percentage_within_condition
FROM admissions a
JOIN hospitals h ON a.hospital_id = h.hospital_id
WHERE a.medication IS NOT NULL AND a.medication <> ''
GROUP BY a.medical_condition, a.medication, h.hospital_name
ORDER BY a.medical_condition, prescriptions_count DESC;

-- 7. Admission types analysis: impact on average stay duration and treatment costs
SELECT
    a.admission_type,
    COUNT(a.admission_id) AS total_admissions,
    ROUND(AVG(a.discharge_date - a.date_of_admission), 2) AS avg_length_of_stay,
    ROUND(AVG(a.billing_amount), 2) AS avg_treatment_cost
FROM admissions a
WHERE a.discharge_date IS NOT NULL
GROUP BY a.admission_type
ORDER BY total_admissions DESC;

-- 8. Insurance provider performance: coverage volume, cost, and outcomes
SELECT
    i.insurance_name,
    COUNT(a.admission_id) AS total_patients_covered,
    ROUND(AVG(a.billing_amount), 2) AS avg_treatment_cost,
    COUNT(CASE WHEN a.test_results ILIKE 'Normal' THEN 1 END) AS normal_results,
    COUNT(CASE WHEN a.test_results ILIKE 'Abnormal' THEN 1 END) AS abnormal_results,
    COUNT(CASE WHEN a.test_results ILIKE 'Inconclusive' THEN 1 END) AS inconclusive_results
FROM admissions a
JOIN insurance_providers i ON a.insurance_id = i.insurance_id
GROUP BY i.insurance_name
ORDER BY total_patients_covered DESC;
