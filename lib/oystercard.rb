class Oystercard
  MAXIMUM_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail 'Balance too low' if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
