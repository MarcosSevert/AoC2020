import sequtils

var count: int = 0
var sum: int  = 0
var yes = newSeq[char]()

for line in lines "input.txt":
  if line.len() == 0:
    sum += count
    count = 0
    yes = newSeq[char]()
  else:
    for c in line:
      if not(c in yes):
        yes.add(c)
        count += 1

sum += count
echo sum
