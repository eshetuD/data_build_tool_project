SELECT 
    type
FROM {{ref("traffic_congestion")}}
WHERE
    type = 'car' AND 
    type = 'Heavy Vehicle' AND
    type = 'Motorcycle' AND
    type = 'Medium Vehicle' AND
    type = 'Bus' AND
    type = 'Taxi'