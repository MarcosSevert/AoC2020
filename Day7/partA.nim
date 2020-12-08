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
const StartColor: string = "shiny gold"
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

  # Declare new rule Inner sequence
  var sub_rules = newSeq[Inner]()

  # If there is no subrule no Inner sequence is needed
  if not("no other bags" == parts[1].strip()):
    # Add subrules to Inner sequence
    for sub_rule in parts[1].strip().split(','):
      var inner: Inner = new(Inner)

      # Get count
      var num: int
      discard parseInt(sub_rule.strip().split(" ")[0],num)
      inner.count = num

      # Get name (color of the bag)
      inner.name = sub_rule.strip()[1 .. ^5].strip()

      # Add inner to Inner sequence
      sub_rules.add(inner)

  ret_rule.bags = sub_rules
  return ret_rule
#______________________________________________________________________________


# Procedure to search for bags containing a color______________________________
proc search_rules(color: string): seq[int]:
  # Index sequence
  var indexes = newSeq[int]()
  return indexes
#______________________________________________________________________________



# Load all rules
for line in lines "input.txt":
  rules.add(parse_line(line))
  echo parse_line(line).name
