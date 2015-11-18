require_relative '../morse'

describe Morse do
  describe "constant TABLE" do
    it "exists" do
      expect(described_class::TABLE).to eq({"A"=>".-", "N"=>"-.", "B"=>"-...", "O"=>"---", "C"=>"-.-.", "P"=>".--.", "D"=>"-..", "Q"=>"--.-", "E"=>".", "R"=>".-.", "F"=>"..-.", "S"=>"...", "G"=>"--.", "T"=>"-", "H"=>"....", "U"=>"..-", "I"=>"..", "V"=>"...-", "J"=>".---", "W"=>".--", "K"=>"-.-", "X"=>"-..-", "L"=>".-..", "Y"=>"-.--", "M"=>"--", "Z"=>"--.."})
    end
  end

  describe "#translate(string)" do
    subject { described_class.new.translate(string) }
    context 'with a single character' do
      let(:string) { "a" }
      it "returns translated character" do
        expect(subject).to eq(".-") 
      end      
    end

    context 'with a word' do
      let(:string) { "dog" }
      it "returns translated word" do
        expect(subject).to eq("-.. --- --.") 
      end
    end

    context 'with a sentence' do
      let(:string) { "The dog is big" }
      it "returns translated sentence" do
        expect(subject).to eq('- .... . / -.. --- --. / .. ... / -... .. --.')
      end
    end
  end
end

describe MorseInterface do
  describe "#run" do
    let(:mock_in) { double("STDIN", gets: input) }
    let(:input) { "dog" }

    it "asks the user for input to translate" do
      expect(STDOUT).to receive(:puts).with("What would you like to translate?")
      expect(STDOUT).to receive(:puts).with("-.. --- --.")
      described_class.new(stdin: mock_in).run
    end
  end
end
