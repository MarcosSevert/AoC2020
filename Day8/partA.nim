import strutils
import parseutils

# Rule type definition_________________________________________________________
type
  Rule = ref object
    op: string
    val: int
    visited: bool
#______________________________________________________________________________


# Procedure to parse input as a rule___________________________________________
proc parse_line(line: string):Rule =
  # Declare rule to be returned
  var ret_rule: Rule = new(Rule)

  # Get op name
  ret_rule.op = line.split(" ")[0].strip()

  # Get value
  if line.split(" ")[1].strip()[0] == '+':
    var num: int
    discard parseInt(line.split(" ")[1].strip()[1 .. ^1],num)
    ret_rule.val = num
  else:
    var num: int
    discard parseInt(line.split(" ")[1].strip()[1 .. ^1],num)
    ret_rule.val = - num

  # Set visited value to false
  ret_rule.visited = false

  return ret_rule
#______________________________________________________________________________


# Sequence of rules____________________________________________________________
var rules = newSeq[Rule]()
#______________________________________________________________________________

# Load all rules
for line in lines "input.txt":
  rules.add(parse_line(line))

# Declaration of accumulator and pointer
var accumulator: int = 0
var pointer: int = 0

# Infinite loop
while true:
  if rules[pointer].visited:
    break
  else:
    rules[pointer].visited = true
    case rules[pointer].op:
      of "nop":
        pointer += 1
      of "acc":
        accumulator += rules[pointer].val
        pointer += 1
      of "jmp":
        pointer += rules[pointer].val

# Echo accumulator value
echo accumulator
