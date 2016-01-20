# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './node'

# Confirms behavior of a Graph
class GraphTest < Minitest::Test
  ('A'..'G').each { |label| const_set label.to_sym, Node.new }
  B > A
  B > C > D > E > B > F
  C > D
  C > E

  def test_can_reach
    assert(A.can_reach? A)
    refute(A.can_reach? B)
    refute(G.can_reach? B)
    assert(B.can_reach? A)
    assert(C.can_reach? F)
    refute(B.can_reach? G)
  end

  def test_hop_count
    assert_equal(0, A.hop_count(A))
    assert_equal(1, B.hop_count(A))
    assert_equal(3, C.hop_count(F))
    assert_raises(RuntimeError) { A.hop_count(B) }
    assert_raises(RuntimeError) { G.hop_count(B) }
    assert_raises(RuntimeError) { B.hop_count(G) }
  end

end