WITH anomaly_detection as(
    SELECT vt.type, COUNT(tr.track_id) AS anomaly_count,tr.lat, tr.lon
    FROM {{source("vehicle_data_src","trajectory_info")}} tr
    JOIN {{source("vehicle_data_src","vehicle_track")}} vt ON vt.track_id=tr.track_id
    WHERE speed = 0
    GROUP BY vt.type, tr.lat, tr.lon
), 

final as (
    select * from anomaly_detection
)

SELECT * FROM final
ORDER BY anomaly_count DESC