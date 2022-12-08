require 'minitest/autorun'
require 'date'

require_relative '../calendar'

require_relative '../event'
require_relative '../birthday'
require_relative '../note'
require_relative '../meeting'

class Calendar_test < Minitest::Test
  def setup
    @cal = Calendar.new
    @cal.events << Meeting.new(1, Date.new(2010, 2, 25), 2)
    @cal.events << Note.new(2, Date.new(2010, 7, 14), 1)
    @cal.events << Meeting.new(3, Date.new(2010, 11, 3), 9)

    @cal.events << Birthday.new(4, Date.new(2011, 1, 25), 10)
    @cal.events << Meeting.new(5, Date.new(2011, 8, 17), 4)
    @cal.events << Note.new(6, Date.new(2011, 8, 17), 3)
    @cal.events << Note.new(7, Date.new(2011, 10, 2), 7)

    @cal.events << Meeting.new(8, Date.new(2014, 5, 4), 5)
    @cal.events << Birthday.new(9, Date.new(2014, 9, 21), 6)
    @cal.events << Note.new(10, Date.new(2014, 12, 28), 8)
  end

  def test_1
    res = @cal.filter_events_by_date(Date.new(2011, 8, 17)).map{|i| i.id}
    assert_equal [5, 6], res
    print "1) ", res, "\n"
  end

  def test_2
    res = @cal.filter_events_by_date_range(Date.new(2010, 11, 3), Date.new(2011, 8, 17)).map{|i| i.id}
    assert_equal [3, 4, 5, 6], res
    print "2) ", res, "\n"
  end

  def test_3
    res = @cal.sort_events_by_date.map{|i| i.id}
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], res
    print "3) ", res, "\n"
  end

  def test_4
    res = @cal.sort_events_by_priority.map{|i| i.id}
    assert_equal [2, 1, 6, 5, 8, 9, 7, 10, 3, 4], res
    print "4) ", res, "\n"
  end

  def test_5
    res = @cal.get_nearest_events(Date.new(2011, 1, 25), 365).map{|i| i.id}
    assert_equal [4, 5, 6, 7], res
    print "5) ", res, "\n"
  end
end
