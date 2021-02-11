require 'journeylog'
require 'journey'

describe JourneyLog do
let(:journey){ double :journey }
let(:station){ double :station }
let(:journey_class){ double(:journey_class)}
subject {described_class.new(journey_class: journey_class) }

  it 'has an empty journey list by default' do
    expect(subject.journeys).to eq []
  end

  describe '#start' do
    context 'when starting a new journey' do
      it 'starts a new journey' do
        allow(journey_class).to receive(:new).and_return(journey)
        expect(journey_class).to receive(:new).with(entry_station: station)
        subject.start(station)
      end
    end
  end
end
