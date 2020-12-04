import re
import strutils

# This procedure is in charge of counting how many of the fields
# are in the last line as an argument
proc count_fields(line: string): int =
  var count: int = 0

  if line.findAll(re"(byr*)\w+").len() > 0:
    count += 1
  if line.findAll(re"(iyr*)\w+").len() > 0:
    count += 1
  if line.findAll(re"(eyr*)\w+").len() > 0:
    count += 1
  if line.findAll(re"(hgt*)\w+").len() > 0:
    count += 1
  if line.findAll(re"(hcl*)\w+").len() > 0:
    count += 1
  if line.findAll(re"(ecl*)\w+").len() > 0:
    count += 1
  if line.findAll(re"(pid*)\w+").len() > 0:
    count += 1

  return count

# Vars to count all fields in passports and valid ones
var valid: int = 0
var fields: int = 7
var field_count: int = 0

# Count fields for each line and check if its valid when an empty line
# is found
for line in lines "input.txt":
  if line.len() == 0:
    if field_count >= fields:
      valid += 1
    field_count = 0
  else:
    field_count += count_fields(line)

# Last passport doesn´t end with an empty line
if field_count >= fields:
  valid += 1

echo valid
