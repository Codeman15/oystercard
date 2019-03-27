require 'station'

describe Station do
  describe '#initialize' do

    subject {described_class.new(name: "Old street", zone: 1)} #setup

    it 'should have a staion name' do
      expect(subject.name).to eq("Old street")
    end
    it 'should have a station zone' do
      expect(subject.zone).to eq(1)
    end
  end





  end
