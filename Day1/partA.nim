import parseutils

# Declare input sequence
var inputs = newSeq[int]()

# Read inputs from file
for line in lines "input.txt":
  var num: int
  discard parseInt(line,num)
  inputs.add(num)

# Declare result variables
var resultA: int
var resultB: int
var multiply: int
var found: bool = false

# Search for result
for i in 0 ..< inputs.len - 1:
  for j in i ..< inputs.len:
    if inputs[j] + inputs[i] == 2020:
      resultA = inputs[i]
      resultB = inputs[j]
      multiply = inputs[i] * inputs[j]
      found = true
      break
  if found:
    break

# Echo results
echo "=== PART A ==="
echo "-> Number 1 = " & $resultA
echo "-> Number 2 = " & $resultB
echo "-> Multiply = " & $multiply
