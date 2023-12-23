with source_trajectory_info as(
    select * from {{source("vehicle_data_src","trajectory_info")}}
),

final as(
    select * from source_trajectory_info
)

select * from final