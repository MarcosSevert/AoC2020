import strutils
import parseutils

# Rule type definition_________________________________________________________
type
  Inner = ref object
    name: string
    count: int
  Bags = seq[Inner]
  Rule = ref object
    name: string
    bags: Bags
#______________________________________________________________________________


# Initial Color________________________________________________________________
const ShinyGold: string = "shiny gold"
#______________________________________________________________________________


# Sequence of rules____________________________________________________________
var rules = newSeq[Rule]()
#______________________________________________________________________________



# Procedure to parse input as a rule___________________________________________
proc parse_line(line: string):Rule =
  # Declare rule to be returned
  var ret_rule: Rule = new(Rule)

  # Delete last dot
  var new_line: string = line[0 .. ^2]

  # Get first part and second one
  var parts = new_line.split("bags contain")

  # Set rule name (color of the bag)
  ret_rule.name = parts[0].strip()

  return ret_rule
#______________________________________________________________________________



for line in lines "test_input.txt":
  echo parse_line(line).name
  break
