# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	begin
		sides = [a,b,c].sort
		case
			when sides.select {|x| x <= 0}.length > 1
				raise TriangleError, "Zero-length or negative side"
			when sides[-1] >= sides[0..-2].reduce(:+)
				raise TriangleError, "Hypotenuse too long"
			when (a == b && b == c)
				:equilateral
			when (a == b || b == c || a == c)
				:isosceles
			else
				:scalene
		end
	end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
