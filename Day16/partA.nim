import sequtils
import parseutils
import strutils

# Restriction type definition_______________________________________________________
type
  Restriction = ref object
    name: string
    min1: int
    max1: int
    min2: int
    max2: int
#______________________________________________________________________________


# Restrictions list
var restrictions = newSeq[Restriction]()

# Read and parse rules
for line in lines "restrictions.txt":
  var r: Restriction = new(Restriction)
  r.name = line.split(":")[0].strip()

  var min1s: string = line.split(":")[1].strip().split("or")[0].strip().split("-")[0].strip()
  var min2s: string = line.split(":")[1].strip().split("or")[1].strip().split("-")[0].strip()
  var max1s: string = line.split(":")[1].strip().split("or")[0].strip().split("-")[1].strip()
  var max2s: string = line.split(":")[1].strip().split("or")[1].strip().split("-")[1].strip()
  var min1: int
  var min2: int
  var max1: int
  var max2: int
  discard parseInt(min1s,min1)
  discard parseInt(min2s,min2)
  discard parseInt(max1s,max1)
  discard parseInt(max2s,max2)

  r.min1 = min1
  r.min2 = min2
  r.max1 = max1
  r.max2 = max2

  restrictions.add(r)


# Search for invalid fields
var sum: int = 0
for line in lines "tickets.txt":
  # For each field in line check all rules
  for field in line.split(","):
    var is_valid: bool = false
    var value: int
    discard parseInt(field,value)
    for restriction in restrictions:
      if (value >= restriction.min1 and value <= restriction.max1) or (value >= restriction.min2 and value <= restriction.max2):
        is_valid = true
        break
    if not is_valid:
      sum = sum + value
      echo value

echo "------------------------------"
echo sum
