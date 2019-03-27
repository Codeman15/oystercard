class Journey
  attr_reader :entry_station, :all_stations

  MIN_FARE = 1
  MAX_FARE = 6

  def initialize
    @entry_station = nil
    @all_stations = []
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    save_journey(station)
    calc_fare(station)
  end

  def calc_fare(exit_station)
    (@entry_station.zone - exit_station.zone).abs + 1
  end

  def in_journey?
    !!entry_station #takes its values (true/false) from entry_station
  end

  private

  def save_journey(exit_station)
    @all_stations << {entry_station: @entry_station, exit_station: exit_station }
  end

end
