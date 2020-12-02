import parseutils
import strutils

# Declare result variables
var valid: int = 0

# Read inputs from file
block lines:
  for line in lines "input.txt":
    # Read min value
    var pos1: int
    discard parseInt(line.split({' ', '-',':'})[0],pos1)

    # Read max value
    var pos2: int
    discard parseInt(line.split({' ', '-',':'})[1],pos2)

    # Read char value
    var c: char = line.split({' ', '-',':'})[2][0]

    # Read string value
    var s: string = line.split({' ', '-',':'})[4]

    # Check input conditions
    if (s[pos1-1] == c and s[pos2-1] != c) or (s[pos1-1] != c and s[pos2-1] == c):
      valid = valid + 1


echo valid
