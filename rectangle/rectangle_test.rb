# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './rectangle'

# Confirms behavior of Rectangle
class RectangleTest < Minitest::Test

  def test_area
    assert_equal(12, Rectangle.new(3, 4).area)
    assert_equal(14, Rectangle.new(2, 7).area)
  end

  def test_perimeter
    assert_equal(14, Rectangle.new(3, 4).perimeter)
    assert_equal(18, Rectangle.new(2, 7).perimeter)
  end

  def test_positive_sides
    assert_raises(ArgumentError) { Rectangle.new(0, 2) }
    assert_raises(ArgumentError) { Rectangle.new(3, -2) }
  end

end