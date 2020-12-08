import strutils
import parseutils

# Rule type definition_________________________________________________________
type
  Rule = ref object
    op: string
    val: int
    visited: bool
#______________________________________________________________________________

# Return type definition_______________________________________________________
type
  Result = ref object
    accumulator: int
    infinite: bool
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


# Procedure tu simulate the rules with the desired change______________________
proc run_change(index: int): Result=
  # Result declaration
  var result_ret: Result = new(Result)

  # Change index
  if rules[index].op == "nop":
    rules[index].op = "jmp"
  else:
    rules[index].op = "nop"

  # Run de simulation
  var accumulator: int = 0
  var pointer: int = 0
  while true:
    if rules[pointer].visited:
      result_ret.infinite = true
      result_ret.accumulator = accumulator
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
      if pointer >= rules.len():
        result_ret.infinite = false
        result_ret.accumulator = accumulator
        break

  # Undo changes
  if rules[index].op == "nop":
    rules[index].op = "jmp"
  else:
    rules[index].op = "nop"
  for r in rules:
    r.visited = false

  
  return result_ret
#______________________________________________________________________________

# Load all rules
var changes = newSeq[int]()
var i: int = 0
for line in lines "input.txt":
  var current_rule = parse_line(line)
  if (current_rule.op == "nop") or (current_rule.op == "jmp"):
    changes.add(i)
  rules.add(current_rule)
  i += 1


for c in changes:
  var res = run_change(c)
  if not res.infinite:
    echo res.accumulator
    break
