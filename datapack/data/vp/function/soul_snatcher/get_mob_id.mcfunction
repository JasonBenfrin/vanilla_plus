# warn-off-file execute-group
tag @s add vp.snatch.target
execute at @s summon area_effect_cloud run ride @n[distance=0..,type=#vp:soul_snatcher_allowed,tag=vp.snatch.target] mount @s
execute on vehicle run data modify storage vp:soul_snatcher.target id set from entity @s Passengers[0].id
kill @n[distance=0..,type=area_effect_cloud]
tag @s remove vp.snatch.target