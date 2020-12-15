import tables
import sequtils

# Limit and input declaration
const limit = 30000000
const input = @[1,20,11,6,12,0]

# Tables to manage the
var first_time = initTable[int, int]()
var second_time = initTable[int, int]()
var last: int

# Go from turn 1 to limit
for turn in 1 .. limit:
  if turn <= input.len:
    last = input[turn - 1]
    first_time[last] = turn
  elif last in first_time and last notIn second_time:
    last = 0
    if last notin first_time:
      first_time[last] = turn
    elif last notin second_time:
      second_time[last] = turn
    else:
      first_time[last] = second_time[last]
      second_time[last] = turn
  elif last in first_time and last in second_time:
    last = second_time[last] - first_time[last]
    if last notin first_time:
      first_time[last] = turn
    elif last notin second_time:
      second_time[last] = turn
    else:
      first_time[last] = second_time[last]
      second_time[last] = turn

echo last
