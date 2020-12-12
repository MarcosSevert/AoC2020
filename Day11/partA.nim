

# Change type definition_______________________________________________________
type
  Change = ref object
    i: int
    j: int
    c: char
#______________________________________________________________________________


# Input problem
var seats = newSeq[string]()


# Read all lines
for line in lines "input.txt":
  seats.add(line)

block outer:
  while true:
    var changes = newSeq[Change]()
    for i in 0..(seats.len()-1):
      for j in 0..(seats[i].len()-1):
        var occupied: int = 0
        # Check upper row adjacent seats
        if ((i-1) >= 0) and ((j-1) >= 0 ) and (seats[i-1][j-1] == '#'):
          occupied += 1
        if (i-1 >= 0) and (seats[i-1][j] == '#'):
          occupied += 1
        if (i-1 >= 0) and (j+1 <= (seats[i].len()-1) ) and (seats[i-1][j+1] == '#'):
          occupied += 1
        # Check same row adjacent seats
        if (j-1 >= 0) and (seats[i][j-1] == '#'):
          occupied += 1
        if (j+1 <= (seats[i].len()-1)) and (seats[i][j+1] == '#'):
          occupied += 1
        # Check below row adjacent seats
        if (i+1 <= (seats.len()-1)) and (j-1 >= 0 ) and (seats[i+1][j-1] == '#'):
          occupied += 1
        if (i+1 <= (seats.len()-1)) and (seats[i+1][j] == '#'):
          occupied += 1
        if (i+1 <= (seats.len()-1)) and (j+1 <= (seats[i].len()-1) ) and (seats[i+1][j+1] == '#'):
          occupied += 1

        # Check if change is needed
        if seats[i][j] == 'L' and occupied == 0:
          var needed: Change = new(Change)
          needed.i = i
          needed.j = j
          needed.c = '#'
          changes.add(needed)
        if seats[i][j] == '#' and occupied >= 4:
          var needed: Change = new(Change)
          needed.i = i
          needed.j = j
          needed.c = 'L'
          changes.add(needed)


    # Apply changes
    if changes.len() == 0:
      break outer
    else:
      for change in changes:
        seats[change.i][change.j] = change.c


# Count occupied seats
var total: int = 0
for line in seats:
  for c in line:
    if c == '#':
      total += 1

echo total
