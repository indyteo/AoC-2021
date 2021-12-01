execute store result score n1 VAR run data get storage aoc Input[0]
execute store result score n2 VAR run data get storage aoc Input[1]
execute store result score n3 VAR run data get storage aoc Input[2]
execute store result score n4 VAR run data get storage aoc Input[3]
data remove storage aoc Input[0]

scoreboard players operation n1 VAR += n2 VAR
scoreboard players operation n1 VAR += n3 VAR
scoreboard players operation n2 VAR += n3 VAR
scoreboard players operation n2 VAR += n4 VAR

execute if score n1 VAR < n2 VAR run scoreboard players operation count VAR += 1 CONST

execute if data storage aoc Input[3] run function aoc:part2_loop
