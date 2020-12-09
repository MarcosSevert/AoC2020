import strutils
import parseutils

# Input sequence
var values = newSeq[int64]()

# Read all lines
for line in lines "input.txt":
  var num: int64
  discard parseBiggestInt(line,num)
  values.add(num)


# Check for first error

block outer:
  for i in 25..(values.len() - 1):
    var error: bool = true
    block inner:
      for j in (i-25)..(i-2):
        if values[j] >= values[i]:
          continue
        for k in (j+1)..(i-1):
          if values[j] + values[k] == values[i]:
            error = false
            break inner
    if error:
      echo values[i]
      break outer
