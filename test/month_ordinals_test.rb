require 'test_helper'

class MonthOrdinalsTest < MiniTest::Test
  def test_first_sundays
    expected_month_ordinals = [
      Date.new(2001, 1, 7), Date.new(2001, 2, 4), Date.new(2001, 3, 4),
      Date.new(2001, 4, 1), Date.new(2001, 5, 6), Date.new(2001, 6, 3)
    ]
    month_ordinals = MonthOrdinals.for 2001..2002

    assert_empty expected_month_ordinals - month_ordinals[:first][:sunday]
  end

  def test_third_tuesdays
    skip
  end

  def test_last_fridays
    expected_month_ordinals = [
      Date.new(2001, 1, 26), Date.new(2001, 2, 23), Date.new(2001, 3, 30),
      Date.new(2001, 4, 27), Date.new(2001, 5, 25), Date.new(2001, 6, 29)
    ]
    month_ordinals = MonthOrdinals.for 2001..2002

    assert_empty expected_month_ordinals - month_ordinals[:last][:friday]
  end
end
