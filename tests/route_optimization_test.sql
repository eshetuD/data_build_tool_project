SELECT 
    average_traveled_distance
FROM {{ref("route_optimization")}}
WHERE average_traveled_distance < 0