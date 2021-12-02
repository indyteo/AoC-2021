with open("input.txt", "r") as data:
	operations = data.readlines()

txt = """DROP TABLE IF EXISTS `aoc_input`;
CREATE TABLE `aoc_input` (`dir` VARCHAR(16), `val` INT);
INSERT INTO `aoc_input` VALUES {};"""
transform = ",".join(["('{}',{})".format(*op[:-1].split(" ")) for op in operations])

with open("input.sql", "w") as output:
	output.write(txt.format(transform))
