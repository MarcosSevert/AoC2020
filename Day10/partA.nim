import algorithm
import parseutils

# Input sequence
var values = newSeq[int]()

# Read all lines
for line in lines "input.txt":
  var num: int
  discard parseInt(line,num)
  values.add(num)

# Sort values
values.sort(system.cmp)

# Count vars
var dif1: int = 0
var dif2: int = 0
var dif3: int = 0

# Count differences
for i in 0..(values.len()-2):
  if values[i+1]-values[i] == 1:
    dif1 += 1
  elif values[i+1]-values[i] == 2:
    dif2 += 1
  elif values[i+1]-values[i] == 3:
    dif3 += 1
  else:
    break

echo dif1+1
echo dif2+1
echo dif3+1
echo "--------------------"
echo (dif1+1)*(dif3+1)
