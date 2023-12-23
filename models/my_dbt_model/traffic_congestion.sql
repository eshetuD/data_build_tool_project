WITH traffic_congestion as(
    SELECT vt.type, tr.lat, tr.lon, COUNT(tr.*) AS congestion_count
    FROM {{source("vehicle_data_src","trajectory_info")}} tr
    JOIN {{source("vehicle_data_src","vehicle_track")}} vt ON vt.track_id=tr.track_id
    WHERE speed < 8.9178
    GROUP BY vt.type, tr.lat, tr.lon

), 

final as (
    select * from traffic_congestion
)

SELECT * FROM final
ORDER BY congestion_count DESC