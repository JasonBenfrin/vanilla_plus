advancement revoke @s only vp:staff_of_teleportation/use

execute if items entity @s weapon.mainhand *[custom_data~{vp:"staff_of_teleportation"}] run function vp:staff_of_teleportation/regive {hand: "mainhand"}
execute if items entity @s weapon.offhand *[custom_data~{vp:"staff_of_teleportation"}] run function vp:staff_of_teleportation/regive {hand: "offhand"}

playsound minecraft:entity.illusioner.prepare_mirror master @a ~ ~ ~ 1 0.76
particle minecraft:reverse_portal ~ ~ ~ 0 1 0 1 500
execute anchored eyes positioned ^ ^ ^8 run function vp:staff_of_teleportation/raycast