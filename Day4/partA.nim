import re
import strutils

var line: string = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd"
for match in line.findAll(re"(pid*)\w+"):
  echo match
