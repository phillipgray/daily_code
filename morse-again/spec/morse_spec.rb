require_relative '../morse'

describe Morse do
  describe "MORSE_TABLE" do
    it "exists" do
      expect(described_class::MORSE_TABLE).to eq({"A"=>".-", "N"=>"-.", "B"=>"-...", "O"=>"---", "C"=>"-.-.", "P"=>".--.", "D"=>"-..", "Q"=>"--.-", "E"=>".", "R"=>".-.", "F"=>"..-.", "S"=>"...", "G"=>"--.", "T"=>"-", "H"=>"....", "U"=>"..-", "I"=>"..", "V"=>"...-", "J"=>".---", "W"=>".--", "K"=>"-.-", "X"=>"-..-", "L"=>".-..", "Y"=>"-.--", "M"=>"--", "Z"=>"--.."})
    end
    
  end
  describe "#translate" do
    subject{ described_class.new.translate(string) }
    context "with a single character" do
      let(:string) { 'a' }
      it "returns translated character" do
        expect(subject).to eq('.-')
      end
    end

    context 'with a single word' do
      let(:string) { 'dog' }
      it "returns the translated word" do
        expect(subject).to eq('-.. --- --.')
      end     
    end

    context 'with a full sentence' do
      let(:string) { 'a dog barks' }
      it "returns the translated sentence" do
        expect(subject).to eq('.- / -.. --- --. / -... .- .-. -.- ...')
      end
    end
  end
end
