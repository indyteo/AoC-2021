function aoc:input
scoreboard players set count VAR 0

function aoc:part2_loop

tellraw @s [{"text":"[Partie 2] Résultat : "},{"score":{"name":"count","objective":"VAR"},"interpret":"true"}]
