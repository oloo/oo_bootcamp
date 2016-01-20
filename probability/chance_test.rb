# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './chance'

# Confirms behavior of Chance
class ChanceTest < Minitest::Test

  IMPOSSIBLE = 0.chance
  UNLIKELY = 0.25.chance
  EQUALLY_LIKELY = 0.5.chance
  LIKELY = 0.75.chance
  CERTAIN = Chance::CERTAIN_VALUE.chance
  

  def test_equality
    assert_equal(0.25.chance, UNLIKELY)
    refute_equal(LIKELY, Object.new)
    refute_equal(LIKELY, nil)
  end

  def test_hash
    assert_equal(0.25.chance.hash, UNLIKELY.hash)
  end

  def test_not
    assert_equal(UNLIKELY, ~LIKELY)
    assert_equal(LIKELY, ~~LIKELY)
    assert_equal(CERTAIN, ~IMPOSSIBLE)
    assert_equal(0.2.chance, ~~0.2.chance)
  end

  def test_and
    assert_equal(UNLIKELY, EQUALLY_LIKELY & EQUALLY_LIKELY)
    assert_equal(0.1875.chance, UNLIKELY & LIKELY)
    assert_equal(LIKELY & UNLIKELY, UNLIKELY & LIKELY)
    assert_equal(LIKELY, CERTAIN & LIKELY)
    assert_equal(IMPOSSIBLE, UNLIKELY & IMPOSSIBLE)
  end

  def test_or
    assert_equal(LIKELY, EQUALLY_LIKELY | EQUALLY_LIKELY)
    assert_equal(0.8125.chance, UNLIKELY | LIKELY)
    assert_equal(LIKELY | UNLIKELY, UNLIKELY | LIKELY)
    assert_equal(CERTAIN, CERTAIN | LIKELY)
    assert_equal(UNLIKELY, UNLIKELY | IMPOSSIBLE)
  end

end