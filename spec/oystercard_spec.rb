
require 'Oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'i want money on my card' do
      expect(subject.balance).to eq 0
    end
    it 'raise error if max balance exceeded' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up 1}.to raise_error 'Maximum balance exceeded'
    end
    it 'raise error if min balance not met' do
      min_balance = Oystercard::MIN_BALANCE
      expect{ subject.touch_in}.to raise_error 'Balance too low'
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  end
  it 'i want to top up my card' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  describe '#touch_in' do
    describe 'i want to be able to touch in' do
      it { is_expected.to respond_to(:touch_in) }
    end
    it 'card is in use if touch in is called' do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey?).to be_truthy
    end

  end

  describe '#touch_out' do
    describe 'i want to be able to touch out' do
      it { is_expected.to respond_to(:touch_out) }
    end
    it 'card is out of use if touch out is called' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to be_falsey
    end
    it 'i want to deduct from my card' do
      min_fare = Oystercard::MIN_FARE
      subject.top_up(10)
      subject.touch_in
      expect{ subject.touch_out}.to change{ subject.balance }.by -(min_fare)
    end

  describe '#in_journey?' do
    describe 'i want to be able to touch in' do
      it { is_expected.to respond_to(:in_journey?) }
    end
  end
end


end
