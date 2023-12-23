WITH identify_violation as(
    SELECT vt.type, COUNT(vt.*) AS violation_count
    FROM {{source("vehicle_data_src","trajectory_info")}} tr
    JOIN {{source("vehicle_data_src","vehicle_track")}} vt ON vt.track_id=tr.track_id
    WHERE tr.speed > 60
    GROUP BY vt.type

),

final as (
    select * from identify_violation
)

SELECT * FROM final
ORDER BY violation_count DESC