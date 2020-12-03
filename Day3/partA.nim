# Declare slope values
var slope_x: int = 3
var slope_y: int = 1

# Declare initial position and tree count
var x0: int = 0
var trees: int = 0

# As we have to check until we leave the map below and slope_y = 1,
# just go through all the rows and count trees
var x: int = x0
for line in lines "input.txt":
    if line[x] == '#':
      trees = trees + 1
    # We make the module of the increment because
    # the map repeats itself to the right in an infinite way.
    x = (x + slope_x) mod line.len()

echo trees
