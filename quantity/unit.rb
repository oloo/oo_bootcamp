# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require_relative './ratio_quantity'

# Understands a specific metric
class Unit
  attr_reader :base_unit_count, :offset, :unit_type
  protected :base_unit_count, :offset, :unit_type

  def initialize(plural_label, amount, relative_unit, offset = 0)
    @base_unit_count = amount.to_f * relative_unit.base_unit_count
    @offset = offset
    @unit_type = relative_unit.unit_type
    create_numeric_builder(plural_label, @unit_type)
  end

  def converted_amount(other, other_amount)
    raise ArgumentError unless self.compatible? other
    (other_amount - other.offset) * other.base_unit_count / self.base_unit_count + self.offset
  end

  def hash_amount(amount)
    (amount * base_unit_count).hash
  end

  def compatible?(other)
    self.unit_type == other.unit_type
  end

  private

    def create_numeric_builder(plural_label, unit_type)
      unit = self
      Numeric.class_eval do
        define_method plural_label.to_s do
          unit_type.quantity(self, unit)
        end
      end
    end

  class BaseUnit
    def initialize(quantity_class); @quantity_class = quantity_class; end
    def base_unit_count; 1; end
    def unit_type; self; end
    def quantity(amount, unit); @quantity_class.new(amount, unit); end
  end

  teaspoon = Unit.new('teaspoons', 1, BaseUnit.new(RatioQuantity))
  tablespoon = Unit.new('tablespoons', 3, teaspoon)
  ounce = Unit.new('ounces', 2, tablespoon)
  cup = Unit.new('cups', 8, ounce)
  pint = Unit.new('pints', 2, cup)
  quart = Unit.new('quarts', 2, pint)
  gallon = Unit.new('gallons', 4, quart)

  inch = Unit.new('inches', 1, BaseUnit.new(RatioQuantity))
  foot = Unit.new('feet', 12, inch)
  yard = Unit.new('yards', 3, foot)
  mile = Unit.new('miles', 1760, yard)

  celcius = Unit.new('celcius', 1, BaseUnit.new(IntervalQuantity))
  fahrenheit = Unit.new('fahrenheit', 5/9.0, celcius, 32)

  private_class_method :new

end