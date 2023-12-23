with clean_traject_info as(
    SELECT 
        track_id, 
        lat::double precision, 
        lon::double precision, 
        speed::double precision, 
        lon_acc::double precision, 
        lat_acc::double precision,
        TO_CHAR(TO_TIMESTAMP(time * 86400), 'HH24:MI:SS') AS timestamp
    FROM {{source("vehicle_data_src","trajectory_info")}}
),
final as (
    select * from clean_traject_info
)

select * from final