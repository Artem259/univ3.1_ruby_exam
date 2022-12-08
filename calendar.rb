class Calendar
  attr_accessor :events

  def initialize
    @events = []
  end

  def filter_events_by_date(date)
    @events.select{|i| i.date == date}
  end

  def filter_events_by_date_range(start_date, end_date)
    @events.select{|i| i.date >= start_date && i.date <= end_date}
  end

  def sort_events_by_date
    @events.sort_by{|i| i.date}
  end

  def sort_events_by_priority
    @events.sort_by{|i| i.priority}
  end

  # передбачити можливість видачі нагадувань про найближчі події.
  def get_nearest_events(today_date, future_days)
    filter_events_by_date_range(today_date, today_date + future_days)
  end
end
