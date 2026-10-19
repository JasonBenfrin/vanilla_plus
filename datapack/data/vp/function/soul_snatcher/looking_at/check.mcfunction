# warn-off-file unreachable-condition
# warn-off-file target-selector-no-type

scoreboard players set $vp.count vp.looking_at.filter 0

execute as @e[distance=0..,type=#vp:soul_snatcher_allowed,scores={vp.looking_at.filter=1}] run function vp:soul_snatcher/looking_at/filter
execute store success score $vp.found_in_group vp.looking_at.filter if predicate vp:looking_at_included_allowed_mob
execute if score $vp.found_in_group vp.looking_at.filter matches 1 run scoreboard players reset @e[distance=0..,tag=!vp.looking_at.included,scores={vp.looking_at.filter=1}] vp.looking_at.filter
execute if score $vp.found_in_group vp.looking_at.filter matches 0 run scoreboard players reset @e[distance=0..,tag=vp.looking_at.included,scores={vp.looking_at.filter=1}] vp.looking_at.filter

# Don't listen to datapack-optimization
# vp.looking_at.filter gets reset to 0 every function call and only increment for each entity by 1
# Meaning there will be a point where the count will only be 1
execute if score $vp.count vp.looking_at.filter matches 2.. run function vp:soul_snatcher/looking_at/check