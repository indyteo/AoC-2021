with open("input.txt", "r") as data:
	values = data.readlines()

txt = """	AREA |.csts|, DATA, READONLY
INPUT DCW {}
REST DCW {}
LENGTH DCW {}
	AREA |.text|, CODE, READONLY
	EXPORT INPUT
	EXPORT LENGTH
	END"""
values = [str(int(value[:-1], 2)) for value in values]
values_len = len(values)
half_len = values_len / 2
transform1 = ",".join(values[:half_len])
transform2 = ",".join(values[half_len:])

with open("input.s", "w") as output:
	output.write(txt.format(transform1, transform2, values_len))
