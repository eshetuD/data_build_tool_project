SELECT 
    speed
FROM {{ref("trajectory_info")}}
WHERE speed < 0