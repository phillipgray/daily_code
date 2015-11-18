require 'spec_helper'

RSpec.describe AnalogClock do
  subject { described_class.new(time) }

  describe "#minute" do
    context "when time is 12:XX" do
      it 'should extract the minute' do
        0.upto(59) do |minute|
          minute_string = minute.to_s.rjust(2, '0')
          time = "12:#{minute_string}"
          clock = AnalogClock.new(time)
          expect(clock.minute).to eq(minute)
        end
      end
    end
  end

  describe '#hour' do
    context 'when time is XX:00' do
      it 'should extract the hour' do
        1.upto(12) do |hour|     
          time = "#{hour}:00"
          clock = AnalogClock.new(time)
          expect(clock.hour).to eq(hour)
        end  
      end
    end
  end
  
  describe '#clock_angle' do
    context 'when time is "12:00"' do
      let(:time) { "12:00" }
      it 'returns 0' do
        expect(subject.clock_angle) .to eq 0
      end
    end

    context 'when time is 6:00' do
      let(:time) { "6:00" }
      it 'returns 180' do
        expect(subject.clock_angle) .to eq 180
      end
    end

    context 'when time is 9:00' do
      let(:time) { "9:00" }
      it 'returns 90' do
        expect(subject.clock_angle) .to eq 90
      end
    end

    context 'given a minute_hand_angle of 90 and hour_hand_angle of 180' do
      let(:time) { "3:00" }
      let(:min_angle) { 0 }
      let(:hour_angle) { 90 }
      it 'returns the difference between the two angles' do
        allow(subject).to receive(:minute_hand_angle) { min_angle }
        allow(subject).to receive(:hour_hand_angle) { hour_angle }
        expect(subject.clock_angle).to eq 90
      end
      
    end
  end

  describe '#minute_hand_angle' do
    context "projects minutes to degrees" do
      it 'returns projected degree' do
        0.upto(59) do |minute|
          minute_string = minute.to_s.rjust(2, '0')
          time = "12:#{minute_string}"
          clock = AnalogClock.new(time)

          expected_minute_hand_angle = 360 * (minute.to_f/60)

          expect(clock.minute_hand_angle).to eq(expected_minute_hand_angle)
        end

      end
    end
    context 'when time is 12:30' do
      let(:time) { "12:30" }
      it 'returns 180' do
        expect(subject.minute_hand_angle).to eq 180        
      end
    end

    context 'when time is 12:00' do
      let(:time) { "12:00" }
      it 'returns 0' do
        expect(subject.minute_hand_angle).to eq 0
      end
    end

    context 'when time is 1:00' do
      let(:time) { "1:00" }
      it 'returns 0' do
        expect(subject.minute_hand_angle).to eq 0
      end
    end
  end

  describe "#hour_hand_angle" do
    context 'changes hours to degrees' do
      it 'returns degree' do
         1.upto(12) do |hour|
           0.upto(60) do |minute|
              minute_string = minute.to_s.rjust(2, '0')
              time = "#{hour}:#{minute_string}"
              clock = AnalogClock.new(time)
              
              estimated_hour_angle = (360 * (hour.to_f / 12)) +
                                     (360 * (minute.to_f / (60 * 12)))

              expect(clock.hour_hand_angle).to eq(estimated_hour_angle)
            # end
          end
        end
      end
    end

    context "when time is 6:00" do
      let(:time) { "6:00" }
      it 'returns 180' do
        expect(subject.hour_hand_angle).to eq(180)
      end
    end
  end
end
