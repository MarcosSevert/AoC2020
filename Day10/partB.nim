import algorithm
import parseutils

# Input sequence
var values = newSeq[int]()

# Procedure to count combinations in a section
proc count_combinations(first_pos: int; last_pos: int): int =
  # If there are just one ore two elements, there is online one combination
  if (last_pos - first_pos) < 2:
    return 1

  # Get finish val and init count
  var last_val: int = values[last_pos]
  var count: int = 0

  # Innit unviisted nodes sequence
  var nodes = newSeq[int]()
  nodes.add(first_pos)

  # search for combinations
  while nodes.len() > 0:
    var current: int = nodes[0]
    if current == last_pos:
      count += 1
    else:
      nodes.add(current + 1)
      if current + 2 <= last_pos:
        nodes.add(current + 2)
      if current + 3 <= last_pos:
        nodes.add(current + 3)
    nodes.delete(0)

  return count



# Read all lines
for line in lines "test_input2.txt":
  var num: int
  discard parseInt(line,num)
  values.add(num)

# Sort values
values.sort(system.cmp)


var result: int = 1
var start_pos: int = 0

block outer:
  while true:
    for i in start_pos..(values.len()-1):
      if i+1 == values.len():
        result = result * count_combinations(start_pos,i)
        break outer
      if (values[i+1]-values[i] == 3):
          result = result * count_combinations(start_pos,i)
          start_pos = i+1
          break

echo result
