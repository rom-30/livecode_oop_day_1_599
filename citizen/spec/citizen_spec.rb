require_relative '../citizen'

describe Citizen do
  describe '#can_vote?' do
    it 'returns true if citizen is 18 years old' do
      citizen = Citizen.new('', '', 18)

      expect(citizen.can_vote?).to eq(true)
    end

    it 'returns false if citizen is less than 18' do
      citizen = Citizen.new('', '', 11)

      expect(citizen.can_vote?).to eq(false)
    end
  end

  describe '#full_name' do
    it 'returns a capitalised full name' do
      citizen = Citizen.new('jimmY', 'pAGE', 77)

      expect(citizen.full_name).to eq('Jimmy Page')
    end
  end
end
