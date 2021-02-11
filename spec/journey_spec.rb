require 'journey'

describe Journey do
  let(:journey) { Journey.new }

  it 'new journey has no starting station' do
    expect(journey.entry_station).to eq nil
  end

  context 'when journey in progress' do
    let(:journey) { Journey.new(:Camden_Town)}

    it 'journey has a starting station' do
      expect(journey.entry_station).to eq :Camden_Town
    end
    it 'journey is in progress' do
      expect(journey.complete?).to be false
    end
  end

  context 'when journey is over' do
    let(:journey) { Journey.new(:Camden_Town)}
    before(:each) do
      journey.fin(:Green_Park)
    end

    it 'journey confirms journey is complete' do
      expect(journey.complete?).to be true
    end
  end

  describe '#fare' do
    let(:journey) { Journey.new(:Camden_Town) }

    it 'calculates minimum fare' do
      journey.fin(:Euston)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'calculates penalty fare' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end


end
