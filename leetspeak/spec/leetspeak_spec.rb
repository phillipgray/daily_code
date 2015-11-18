require_relative '../leetspeak'

RSpec.describe String do
  describe '#leetspeak' do
    it 'returns a string as is when no LeetSpeak rules apply' do
      expect('happy'.leetspeak).to eq('happy')
    end

    it 'replaces every e in a string with a 3' do
      expect('elephant'.leetspeak).to eq('3l3phant')
    end

    it 'replaces every o in a string with a 0' do
      expect('boo boo'.leetspeak).to eq('b00 b00')
    end

    it 'replaces every I in a string with a 1' do
      expect('I like Ike'.leetspeak).to eq('1 l1k3 1k3')
    end

    it 'replaces every s in a string with a z' do
      expect('roses'.leetspeak).to eq('r0z3z')
    end

    it 'replaces every s unless it\'s the first letter' do
      expect('sassafrass'.leetspeak).to eq('sazzafrazz')
    end

    it('replaces letters correctly in a string of words') do
      expect('I scream you scream we all scream for raspberry ice cream'.leetspeak)
        .to eq('1 scr3am y0u scr3am w3 all scr3am f0r razpb3rry 1c3 cr3am')
    end
  end
end
