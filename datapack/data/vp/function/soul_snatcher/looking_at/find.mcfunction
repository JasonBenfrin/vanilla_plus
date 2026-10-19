# Credits to GalSergey

scoreboard players reset * vp.looking_at.ID
scoreboard players reset * vp.looking_at.filter

scoreboard players operation $vp.this vp.ID = @s vp.ID

execute positioned ^ ^ ^5.01 run scoreboard players set @e[type=#vp:soul_snatcher_allowed,distance=..5] vp.looking_at.filter 1
function vp:soul_snatcher/looking_at/check

scoreboard players operation @e[distance=0..,type=#vp:soul_snatcher_allowed,scores={vp.looking_at.filter=1},limit=1] vp.looking_at.ID = $vp.this vp.ID