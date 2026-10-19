advancement revoke @s only vp:soul_snatcher/use

execute unless predicate vp:looking_at_allowed_mob run return run function vp:soul_snatcher/not_allowed { msg: "Must target an allowed mob type" }

function vp:soul_snatcher/looking_at/find
execute as @e[distance=0..,predicate=vp:being_looked_at,type=#vp:soul_snatcher_allowed,limit=1] run return run function vp:soul_snatcher/snatch

function vp:soul_snatcher/not_allowed { msg: "Mob is too far away" }