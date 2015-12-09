class AnalogClock
  attr_reader :string_time

  def initialize(string_time)
    @string_time = string_time
  end

  def minute
    string_time.split(":")[1].to_i
  end

  def hour
    string_time.split(":")[0].to_i
  end

  def minute_hand_angle
    minute.to_f / 60 * 360
  end

  def hour_hand_angle
    (hour.to_f / 12 * 360) + (360 * minute.to_f / 60 / 12)
  end

  def clock_angle
    return 360 - (hour_hand_angle - minute_hand_angle) if (hour_hand_angle - minute_hand_angle) > 180
    (hour_hand_angle - minute_hand_angle) % 360
  end
end
