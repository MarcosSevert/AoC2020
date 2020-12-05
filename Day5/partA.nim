import strutils
import math

# Size constants
const rows: int = 127
const columns: int = 7


# Procedure to get the row
proc get_row(inst: string; current: int; s: int; e: int): int =
  # Last letter
  if e - s == 1:
    if inst[current] == 'B':
      return e
    if inst[current] == 'F':
      return s
  # Recursive call with next interval
  else:
    if inst[current] == 'B':
      return get_row(inst, current + 1, int(((e+s)/2)+1), e)
    if inst[current] == 'F':
      return get_row(inst, current + 1, s, int((e+s)/2))


# Procedure to get the column
proc get_column(inst: string; current: int; s: int; e: int): int =
  # Last letter
  if e - s == 1:
    if inst[current] == 'R':
      return e
    if inst[current] == 'L':
      return s
  # Recursive call with next interval
  else:
    if inst[current] == 'R':
      return get_column(inst, current + 1, int(((e+s)/2)+1), e)
    if inst[current] == 'L':
      return get_column(inst, current + 1, s, int((e+s)/2))

# Search highest seat ID on a boarding pass
var highest: int = 0
for line in lines "input.txt":
  var id:int = (get_row(line[0 .. ^4],0,0,127) * 8) + get_column(line[7 .. ^1],0,0,7)
  if id > highest:
    highest = id

echo highest
