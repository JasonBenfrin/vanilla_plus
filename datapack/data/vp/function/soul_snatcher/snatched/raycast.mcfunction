scoreboard players remove $vp.raycast_limit vp.raycast 1

execute if score $vp.raycast_limit vp.raycast matches ..0 run return run function vp:soul_snatcher/snatched/resummon with storage vp:soul_snatcher_snatched.resummon data

execute positioned ^ ^ ^.01 if block ~ ~ ~ #minecraft:replaceable run function vp:soul_snatcher/snatched/raycast
execute positioned ^ ^ ^.01 unless block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^-0.01 run function vp:soul_snatcher/snatched/resummon with storage vp:soul_snatcher_snatched.resummon data
