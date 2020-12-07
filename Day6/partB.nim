import sequtils

var sum: int  = 0


var is_first: bool = true
var answers = newSeq[char]()
var current = newSeq[char]()

for line in lines "test_input.txt":
  if line.len() == 0:
    is_first = true
    sum += answers.len()
  else:
    if is_first:
      is_first = false
      answers = newSeq[char]()
      for c in line:
        answers.add(c)
    else:
      current = newSeq[char]()
      for c in line:
        current.add(c)
      var pos = newSeq[int]()
      var count: int = 0
      for c in current:
        if not(c in answers):
            pos.add(count)
        count += 1
      for p in pos:
        current.delete(p)
      answers = current

sum += answers.len()
echo sum
