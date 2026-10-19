execute if data entity @s Owner unless function vp:soul_snatcher/owner_id_check as @p[predicate=vp:same_id_as_this] run return run function vp:soul_snatcher/not_allowed { msg: "This isn't your pet!" }

function vp:soul_snatcher/get_mob_id
function vp:soul_snatcher/get_mob_nbt
execute as @p[predicate=vp:same_id_as_this] run function vp:soul_snatcher/give_snatched with storage vp:soul_snatcher.target

execute at @s run function vp:soul_snatcher/snatch_line_7

gamerule minecraft:show_death_messages false
tp @s ~ -256 ~
kill @s
data modify entity @s DeathTime set value 200
gamerule minecraft:show_death_messages true