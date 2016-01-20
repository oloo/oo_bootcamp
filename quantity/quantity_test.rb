# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './unit'

# Confirms behavior of Quantity
class QuantityTest < Minitest::Test

  def test_equality_of_like_units
    assert_equal(3.tablespoons, 3.tablespoons)
    refute_equal(3.tablespoons, 4.tablespoons)
    assert_equal(6.inches, 6.inches)
    assert_equal(45.fahrenheit, 45.fahrenheit)
    refute_equal(3.tablespoons, Object.new)
    refute_equal(3.tablespoons, nil)
  end

  def test_equality_of_different_units
    assert_equal(2.cups, 32.tablespoons)
    assert_equal(32.tablespoons, 2.cups)
    assert_equal(0.5.yards, 18.inches)
    assert_equal(0.celcius, 32.fahrenheit)
    assert_equal(32.fahrenheit, 0.celcius)
    assert_equal(-40.celcius, -40.fahrenheit)
    assert_equal(-40.fahrenheit, -40.celcius)
    assert_equal(10.celcius, 50.fahrenheit)
    assert_equal(50.fahrenheit, 10.celcius)
    assert_equal(100.celcius, 212.fahrenheit)
    assert_equal(212.fahrenheit, 100.celcius)
  end

  def test_hash
    assert_equal(3.tablespoons.hash, 3.tablespoons.hash)
    assert_equal(2.cups.hash, 32.tablespoons.hash)
  end

  def test_forbidden_unit_creation
    assert_raises(NoMethodError) { Unit.new('stones', 1, Unit::BaseUnit.new(RatioQuantity)) }
  end

  def test_arithmetic
    assert_equal(1.5.pints, 32.tablespoons + 1.cups)
    assert_equal(1.cups + 32.tablespoons, 32.tablespoons + 1.cups)
    assert_equal(-0.25.quarts, 0.5.pints - 32.tablespoons)
    assert_equal(-1.5.yards, 6.inches - 5.feet)
  end

  def test_inequality_of_different_metrics
    refute_equal(1.inches, 1.teaspoons)
    refute_equal(1.teaspoons, 1.inches)
    refute_equal(2.tablespoons, 0.5.feet)
  end

  def test_mixed_arithmetic
    assert_raises(ArgumentError) { 2.tablespoons - 0.5.feet }
    assert_raises(ArgumentError) { -0.5.feet - 2.tablespoons }
  end

  def test_invalid_arithmetic
    assert_raises(NoMethodError) { 10.fahrenheit + 10.fahrenheit }
    assert_raises(NoMethodError) { 10.celcius + 10.fahrenheit }
    assert_raises(NoMethodError) { 10.celcius + 2.teaspoons }
    assert_raises(ArgumentError) { 2.tablespoons + 2.fahrenheit }
    assert_raises(NoMethodError) { 2.tablespoons - 2.fahrenheit }
  end

end