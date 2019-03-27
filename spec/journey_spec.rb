require 'journey'

describe Journey do
    let(:station){ double :station, zone: 1 } #telling it to return 1
    let(:exit_station){ double :station, zone: 4 } #telling it to return 4

  describe '#calc_fare' do
    it 'should calculate the fare' do
      subject.start_journey(station)
      expect(subject.calc_fare(exit_station)).to eq 4
    end
  end

  describe '#start_journey' do
    it 'entry station saves' do
      subject.start_journey(station)
      expect(subject.entry_station).to eq station
    end
  end









end
