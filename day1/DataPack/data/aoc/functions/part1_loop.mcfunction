execute store result score n1 VAR run data get storage aoc Input[0]
data remove storage aoc Input[0]
execute store result score n2 VAR run data get storage aoc Input[0]

execute if score n1 VAR < n2 VAR run scoreboard players operation count VAR += 1 CONST

execute if data storage aoc Input[1] run function aoc:part1_loop
