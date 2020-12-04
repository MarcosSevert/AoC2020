import re
import strutils
import parseutils


# This procedure is in charge of counting how many of the fields
# are in the last line as an argument
proc count_fields(line: string): int=
  var count: int = 0

  for field in line.findAll(re"(?!\s+|^)?(\S+:\S+)(?=\s+|$)"):
    var field_name = field.split(':')[0]
    var field_value = field.split(':')[1]

    case field_name
    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    of "byr":
      var value: int
      discard parseInt(field_value, value)
      if value >= 1920 and value <= 2002:
        count += 1
    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    of "iyr":
      var value: int
      discard parseInt(field_value, value)
      if value >= 2010 and value <= 2020:
        count += 1
    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    of "eyr":
      var value: int
      discard parseInt(field_value, value)
      if value >= 2020 and value <= 2030:
        count += 1
    #  hgt (Height) - a number followed by either cm or in:
    #     - If cm, the number must be at least 150 and at most 193.
    #     - If in, the number must be at least 59 and at most 76.
    of "hgt":
      if field_value.len() >= 3 and field_value[field_value.len()-2] == 'c' and field_value[field_value.len()-1] == 'm':
        field_value = field_value[0 .. ^3]
        var value: int
        discard parseInt(field_value, value)
        if value >= 150 and value <= 193:
          count += 1
      if field_value.len() >= 3 and field_value[field_value.len()-2] == 'i' and field_value[field_value.len()-1] == 'n':
        field_value = field_value[0 .. ^3]
        var value: int
        discard parseInt(field_value, value)
        if value >= 59 and value <= 76:
          count += 1
    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    of "hcl":
      if field_value.match(re"#[0-9a-f]{6}"):
        count += 1
    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    of "ecl":
      if field_value in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]:
        count += 1
    # pid (Passport ID) - a nine-digit number, including leading zeroes.
    of "pid":
      if field_value.match(re"\d{9}"):
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
