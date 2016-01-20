# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require_relative './interval_quantity'

# Understands a specific measurement of a ratio metric
class RatioQuantity < IntervalQuantity

  def +(other)
    RatioQuantity.new(self.amount + converted_amount(other), self.unit)
  end

  def -@
    RatioQuantity.new(-@amount, @unit)
  end

  def -(other)
    self + -other
  end

end