advancement revoke @s only vp:soul_snatcher/snatched_use

function vp:soul_snatcher/snatched/get_data
scoreboard players set $vp.raycast_limit vp.raycast 300
execute anchored eyes positioned ^ ^ ^ run function vp:soul_snatcher/snatched/raycast

give @s minecraft:heart_of_the_sea[minecraft:max_stack_size=16,minecraft:consumable={consume_seconds:0.05,animation:"eat",sound:"minecraft:intentionally_empty",has_consume_particles:0b},minecraft:custom_name={text:"Soul Snatcher",italic:0b},minecraft:rarity="uncommon",minecraft:custom_data={vp:"soul_snatcher"}]