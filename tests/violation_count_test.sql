SELECT 
    violation_count
FROM {{ref("identify_violation")}}
WHERE violation_count < 0