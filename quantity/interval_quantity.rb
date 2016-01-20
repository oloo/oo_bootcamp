# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands a specific measurement of a interval metric (on a scale)
class IntervalQuantity
  attr_reader :amount, :unit
  protected :amount, :unit

  EPSILON = 0.000001

  def initialize(amount, unit)
    @amount, @unit = amount, unit
  end

  def ==(other)
    return false unless self.class == other.class
    return false unless self.unit.compatible?(other.unit)
    (self.amount - converted_amount(other)).abs < EPSILON
  end

  def hash
    @unit.hash_amount(@amount)
  end

  def better_than?(other)
    self.amount > converted_amount(other)
  end

  private

    def converted_amount(other)
      self.unit.converted_amount(other.unit, other.amount)
    end

end