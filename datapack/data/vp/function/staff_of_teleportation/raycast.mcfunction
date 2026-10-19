scoreboard players remove $vp.raycast_limit vp.raycast 1

execute if score $vp.raycast_limit vp.raycast matches ..0 align xyz positioned ~.5 ~-1 ~.5 run return run function vp:staff_of_teleportation/tp

execute if block ~ ~ ~ #minecraft:blocks_motion run return run execute positioned ^ ^ ^-.25 run function vp:staff_of_teleportation/raycast
execute if block ~ ~-1 ~ #minecraft:blocks_motion run return run execute positioned ^ ^ ^-.25 run function vp:staff_of_teleportation/raycast

execute align xyz positioned ~.5 ~-1 ~.5 run function vp:staff_of_teleportation/tp