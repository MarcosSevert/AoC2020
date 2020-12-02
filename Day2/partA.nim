import parseutils
import strutils

# Declare result variables
var valid: int = 0

# Read inputs from file
block lines:
  for line in lines "input.txt":
    var count: int = 0
    var flag: bool = false

    # Read min value
    var min: int
    discard parseInt(line.split({' ', '-',':'})[0],min)

    # Read max value
    var max: int
    discard parseInt(line.split({' ', '-',':'})[1],max)

    # Read char value
    var c: char = line.split({' ', '-',':'})[2][0]

    # Read string value
    var s: string = line.split({' ', '-',':'})[4]

    for i in 0 ..< s.len():
      if s[i] == c:
        count = count + 1
      if count > max:
        flag = true
        break

    if flag:
      continue

    if count >= min:
      valid = valid + 1

echo valid
