import parseutils
import strutils

# Read and parse input
var earliest: int  = 0
var ids = newSeq[int]()
var is_first: bool = true
for line in lines "input.txt":
  if is_first:
    is_first = false
    var num: int
    discard parseInt(line,num)
    earliest = num
  else:
    for element in line.split(","):
      if element == "x":
        continue
      else:
        var num: int
        discard parseInt(element,num)
        ids.add(num)


# Look for closest timestamp
var timestamps = newSeq[int]()
for id in ids:
  var timestamp: int = 0
  while(timestamp < earliest):
    timestamp += id
  timestamps.add(timestamp)

var closest_val: int = timestamps[0]
var closest_index: int = 0
var index: int = 0
for t in timestamps:
  if t <= closest_val:
    closest_val = t
    closest_index = index
  index += 1


echo (closest_val - earliest)*ids[closest_index]
