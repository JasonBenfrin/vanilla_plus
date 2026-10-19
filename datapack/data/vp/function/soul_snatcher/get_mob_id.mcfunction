tag @s add vp.snatch.target
execute at @s summon area_effect_cloud run ride @n[distance=0..,type=#vp:soul_snatcher_allowed,tag=vp.snatch.target] mount @s
execute on vehicle run function vp:soul_snatcher/get_mob_id_line_2
tag @s remove vp.snatch.target