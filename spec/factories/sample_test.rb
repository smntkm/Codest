require "test/unit"

class Sample_test < Test::Unit::TestCase
  def test_aa_bb
    s = Sample.new
    actual = s.cat("aa", "bb")
    assert_equal("aabb", actual)
  end

  def test_aa_11
    s = Sample.new
    actual = s.cat("aa", "bb")
    assert_equal("aa11", actual)
  end
end
