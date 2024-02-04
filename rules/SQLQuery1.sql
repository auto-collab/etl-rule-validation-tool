SELECT 'Rule under test header 1' AS RuleUnderTest,
'Test.Schema.Value' AS SchemaUnderTest,
CASE WHEN (COUNT(0) > 0) THEN 'PASS' ELSE 'FAIL' END AS TestResult
FROM superhero h
JOIN hero_power p ON h.id = p.hero_id
JOIN superpower s ON p.power_id = s.id
WHERE h.superhero_name = 'Superman'
;
SELECT 'Rule under test header 2' AS RuleUnderTest,
'Test.Schema.Value' AS SchemaUnderTest,
CASE WHEN (COUNT(0) > 0) THEN 'PASS' ELSE 'FAIL' END AS TestResult
FROM superhero h
JOIN hero_power p ON h.id = p.hero_id
JOIN superpower s ON p.power_id = s.id
WHERE h.superhero_name = 'Batman'
;
SELECT 'Rule under test header 3' AS RuleUnderTest,
'Test.Schema.Value' AS SchemaUnderTest,
CASE WHEN (COUNT(0) > 0) THEN 'PASS' ELSE 'FAIL' END AS TestResult
FROM dbo.superhero
WHERE height_cm > 100
AND gender_id != 2
