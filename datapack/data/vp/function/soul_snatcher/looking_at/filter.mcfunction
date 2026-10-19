scoreboard players add $vp.count vp.looking_at.filter 1

tag @s remove vp.looking_at.included

# This is binary search
# This cmd flips between 0 and 1 for each entity
execute store success score $vp.is_included vp.looking_at.filter unless score $vp.is_included vp.looking_at.filter matches 1
execute if score $vp.is_included vp.looking_at.filter matches 1 run tag @s add vp.looking_at.included