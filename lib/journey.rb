class Journey
  attr_reader :entry_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    (@entry_station != nil) && (@exit_station != nil)
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end

end


=begin
move following functions/attributes over to journey
entry staton
exit station
in journey?
calculate fare

=end
