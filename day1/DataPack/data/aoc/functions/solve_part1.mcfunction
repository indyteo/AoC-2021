function aoc:input
scoreboard players set count VAR 0

function aoc:part1_loop

tellraw @s [{"text":"[Partie 1] Résultat : "},{"score":{"name":"count","objective":"VAR"},"interpret":"true"}]
