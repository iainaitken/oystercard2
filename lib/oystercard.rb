class Oystercard
attr_reader :balance, :maximum_amount, :latest_journey, :journey_history, :journey
MAXIMUM_AMOUNT = 90
MINIMUM_AMOUNT = 1

  def initialize(topup_limit = MAXIMUM_AMOUNT)
    @balance = 0
    @maximum_amount = topup_limit
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(amount)
    fail "reached topup limit of #{maximum_amount}!" if @balance + amount > @maximum_amount
    @balance += amount
  end

  def touch_in(entry_station)
    fail "You have less than #{MINIMUM_AMOUNT} on your card" if @balance < MINIMUM_AMOUNT
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    deduct(@journey.fare)
    @journey_history.push @journey
    @journey = Journey.new
  end

private
def deduct(amount)
  @balance -= amount
end


end
