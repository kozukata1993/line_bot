class ApplicationController < ActionController::Base
  before_action :make_reply

  def make_reply
    year = Time.zone.now.year
    month = Time.zone.now.month
    day = Time.zone.now.day
    first_day = Time.zone.local(year, month, 1)
    last_day = (first_day + 1.month) - 1.day

    month_array = [*first_day.day..last_day.day].map { |d| Time.zone.local(year, month, d) }
    calendar_array = [[], [], [], [], []]

    i = 0
    month_array.each do |date|
      calendar_array[i] << date
      i += 1 if date.saturday?
    end

    calendar_range_array = calendar_array.map do |week|
      (week[0]...(week[-1] + 1.day))
    end

    now = Time.zone.now
    if (calendar_range_array[1].include?(now) && now.thursday?) ||
      (calendar_range_array[3].include?(now) && now.thursday?)
      @reply_text = 'ペットボトルを捨てる日です'
    elsif now.tuesday? || now.friday?
      @reply_text = '燃えるゴミを捨てる日です'
    elsif now.saturday?
      @reply_text = '缶と瓶を捨てる日です'
    else
      @reply_text = "Success!!"
    end
  end
end
