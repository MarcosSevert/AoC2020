import strutils
import parseutils

# Input sequence
var values = newSeq[int64]()

# Read all lines
for line in lines "input.txt":
  var num: int64
  discard parseBiggestInt(line,num)
  values.add(num)

# My solution from part A
var error: int64 = 22406676
#var error: int64 = 127

# Check for first values
block outer:
  for i in 0..(values.len()-2):
    var min: int64 = values[i]
    var max: int64 = values[i]
    var sum: int64 = values[i]
    if sum >= error:
      continue
    for j in (i+1)..(values.len()-1):
      sum = sum + values[j]
      if sum > error:
        break
      else:
        if values[j] < min:
          min = values[j]
        if values[j] > max:
          max = values[j]
        if sum == error:
          echo min
          echo max
          echo "___________"
          echo min+max
          break outer
