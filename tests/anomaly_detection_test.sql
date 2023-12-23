SELECT 
    anomaly_count
FROM {{ref("anomaly_detection")}}
WHERE anomaly_count < 0