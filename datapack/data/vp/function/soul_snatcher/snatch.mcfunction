execute if data entity @s Owner unless function vp:soul_snatcher/owner_id_check as @p[predicate=vp:same_id_as_this] run return run function vp:soul_snatcher/not_allowed { msg: "This isn't your pet!" }

function vp:soul_snatcher/get_mob_id
function vp:soul_snatcher/get_mob_nbt
function vp:soul_snatcher/give_snatched with storage vp:soul_snatcher.target

execute at @s run function vp:soul_snatcher/snatch_line_7

gamerule minecraft:show_death_messages false
function vp:soul_snatcher/tp_and_kill
gamerule minecraft:show_death_messages true