with open("input.txt", "r") as data:
    numbers = data.readlines()

txt = "data modify storage aoc Input set value [{}]"
transform = ",".join([number[:-1] for number in numbers])

with open("DataPack/data/aoc/functions/input.mcfunction", "w") as output:
    output.write(txt.format(transform))
