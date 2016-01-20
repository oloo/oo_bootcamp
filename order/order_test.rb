# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './order'
require_relative '../probability/chance'
require_relative '../quantity/unit'

# Confirms behavior of Order
class OrderTest < Minitest::Test

  def test_chance
    assert_equal(0.8.chance, Order.max(0.25.chance, 0.1.chance, 0.8.chance, 0.5.chance))
  end

  def test_quantity
    assert_equal(24.ounces, Order.max(6.ounces, 1.5.pints, 0.25.quarts, 6.tablespoons))
  end

end