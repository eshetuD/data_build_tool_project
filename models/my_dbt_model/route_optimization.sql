WITH anomaly_detection as(
    SELECT tr.lat, tr.lon, AVG(vt.traveled_d) AS average_traveled_distance
    FROM {{source("vehicle_data_src","trajectory_info")}} tr
    JOIN {{source("vehicle_data_src","vehicle_track")}} vt ON vt.track_id=tr.track_id
    WHERE time BETWEEN 0 AND 23
    GROUP BY tr.lat, tr.lon
),

final as (
    select * from anomaly_detection
)

SELECT * FROM final
ORDER BY average_traveled_distance DESC