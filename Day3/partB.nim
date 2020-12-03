var options = [
  (1, 1),
  (7, 1),
  (3, 1),
  (5, 1),
  (1, 2)
]

var multiply: int = 1

# Initial positions
var x0: int = 0
var y0: int = 0

for slope_x,slope_y in options.items:
  var trees: int = 0

  # As we have to check until we leave the map below,
  # just go through all the rows and count trees
  var x: int = x0
  var y: int = y0
  var expected_y: int = y0
  for line in lines "input.txt":
      # As slope_y is not always 1, we have to check if
      # we are in the correct line
      if y == expected_y:
        expected_y = expected_y + slope_y
        if line[x] == '#':
          trees = trees + 1
        x = (x + slope_x) mod line.len()
      y += 1
  multiply = multiply * trees


echo multiply
