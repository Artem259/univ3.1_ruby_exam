class Event
  attr_accessor :id, :date, :priority
  attr_reader :periodical, :period

  def initialize(id, date, priority)
    @id = id
    @date = date
    @priority = priority
    @periodical = false
    @period = nil
  end

  # передбачити можливість роботи з періодичними подіями
  def periodical?
    @periodical
  end
end
