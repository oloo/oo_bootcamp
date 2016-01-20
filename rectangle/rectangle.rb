# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands a four-sided polygon with sides at right angles
class Rectangle

  def initialize(length, width)
    raise ArgumentError unless length > 0 && width > 0
    @length, @width = length, width
  end

  def area
    @length * @width
  end

  def perimeter
    2 * (@length + @width)
  end

end