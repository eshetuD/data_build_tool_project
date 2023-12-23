with source_vehicle_info as(
    select * from {{source("vehicle_data_src","vehicle_track")}}
),

final as(
    select * from source_vehicle_info
)

select * from final