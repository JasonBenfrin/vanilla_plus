advancement revoke @s only vp:staff_of_teleportation/use

function vp:staff_of_teleportation/regive

playsound minecraft:entity.illusioner.prepare_mirror master @a ~ ~ ~ 1 0.76
particle minecraft:reverse_portal ~ ~ ~ 0 1 0 1 500

scoreboard players set $vp.raycast_limit vp.raycast 20
execute anchored eyes positioned ^ ^ ^8 run function vp:staff_of_teleportation/raycast