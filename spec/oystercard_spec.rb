
require 'Oystercard'

describe Oystercard do
  let(:station){ double :station }
  describe '#initialize' do
    it 'it has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'i want to top up my card' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
    it 'raise error if max balance exceeded' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up(1) }.to raise_error 'Maximum balance of £#{MAXIMUM_BALANCE} exceeded'
    end
  end

  describe '#touch_in' do
    it 'in_journey becomes true if touch_in is called' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to be_truthy
    end
    it 'raise error if min balance not met' do
      min_balance = Oystercard::MIN_BALANCE
      expect{ subject.touch_in(station) }.to raise_error 'Balance too low'
    end
    it 'remeber entry station' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }
    it 'in_journey becomes false if touch_out is called' do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to be_falsey
    end
    it 'deduct fare from card' do
      min_fare = Oystercard::MIN_FARE
      subject.top_up(10)
      subject.touch_in(station)
      expect{ subject.touch_out}.to change{ subject.balance }.by -(min_fare)
    end
    it 'forgets entry staion on touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }
  end






end
