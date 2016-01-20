# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands the likelihood of something occurring
class Chance
  attr_reader :fraction
  protected :fraction

  CERTAIN_VALUE = 1.0
  EPSILON = 0.0000001

  def initialize(likelihood_as_fraction)
    @fraction = likelihood_as_fraction
  end

  def ==(other)
    return false unless other.is_a? Chance
    (self.fraction - other.fraction).abs < EPSILON
  end

  def hash
    @fraction.hash + 11 * Chance.hash
  end

  def ~@
    Chance.new(CERTAIN_VALUE - @fraction)
  end

  def &(other)
    Chance.new(self.fraction * other.fraction)
  end

  # DeMorgan's Law (http://en.wikipedia.org/wiki/De_Morgan%27s_laws)
  def |(other)
    ~(~self & ~other)
  end

  def better_than?(other)
    self.fraction > other.fraction
  end

end

class Numeric

  def chance
    Chance.new(self)
  end
  
end