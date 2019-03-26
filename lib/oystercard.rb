class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2


  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail 'Maximum balance of £#{MAXIMUM_BALANCE} exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Balance too low' if balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station #takes its values (true/false) from entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
