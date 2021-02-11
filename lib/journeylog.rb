class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = nil
  end

  def start(entrystation)
    @current_journey = @journey_class.new(entrystation)
    @journeys << @current_journey
  end

  def finish(exitstation)
    @current_journey.fin(exitstation)
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    @current_journey ||= journey_class.new
  end

end
