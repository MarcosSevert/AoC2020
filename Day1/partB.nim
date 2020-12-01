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
var resultC: int
var multiply: int
var found: bool = false

# Search for result
for i in 0 ..< inputs.len - 2:
  for j in i+1 ..< inputs.len - 1:
    for k in j+1 ..< inputs.len:
      if inputs[j] + inputs[i] + inputs[k] == 2020:
        resultA = inputs[i]
        resultB = inputs[j]
        resultC = inputs[k]
        multiply = inputs[i] * inputs[j] * inputs[k]
        found = true
        break
    if found:
      break
  if found:
    break

echo resultA
echo resultB
echo resultC
echo multiply
