SELECT 
    timestamp
FROM {{ref("correct_data_type")}}
WHERE timestamp not between '0:00' AND '23:59'