#!/bin/bash

numbers=$(head input.txt -n 1 | sed "s/,/ /g")
grids=$(tail input.txt -n +3 | sed ':a;N;$!ba;s/\n\n/_/g;s/\n/-/g')

OLD_IFS=$IFS

winGrid=""
winNumber=""
for number in $numbers; do
	updatedGrids=""
	IFS="_"
	for grid in $grids; do
		IFS="-"
		for line in $grid; do
			IFS=" "
			for value in $line; do
				if [ "$value" != "x" ] && [ "$value" -eq "$number" ]; then
					value="x"
				fi
				updatedGrids="$updatedGrids $value"
			done
			updatedGrids="${updatedGrids}-"
		done
		updatedGrids="${updatedGrids}_"
	done
	grids="$updatedGrids"

	filteredGrids=""
	IFS="_"
	for grid in $grids; do
		matching=$(echo "$grid" | grep -E "(( x){5}-|( x( [x0-9]{1,2}){4}-){5}|( [x0-9]{1,2} x( [x0-9]{1,2}){3}-){5}|(( [x0-9]{1,2}){2} x( [x0-9]{1,2}){2}-){5}|(( [x0-9]{1,2}){3} x [x0-9]{1,2}-){5}|(( [x0-9]{1,2}){4} x-){5})")
		if [ -z "$matching" ]; then
			if [ -z "$filteredGrids" ]; then
				filteredGrids="$grid"
			else
				filteredGrids="${filteredGrids}_$grid"
			fi
		else
			winGrid="$matching"
		fi
	done
	grids="$filteredGrids"
	if [ -z $(echo "$grids" | tr -d "_") ]; then
		winNumber="$number"
		break
	fi
done

total=0
IFS="-"
for line in $winGrid; do
	IFS=" "
	for value in $line; do
		if [ "$value" != "x" ]; then
			((total+=value))
		fi
	done
done
echo "[Part2] Result: $((total*winNumber))"

IFS=$OLD_IFS
