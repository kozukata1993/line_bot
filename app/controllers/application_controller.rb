class ApplicationController < ActionController::Base
  before_action :make_reply

  def make_reply
    year = Time.zone.now.year
    month = Time.zone.now.month
    day = Time.zone.now.day
    first_day = Time.zone.local(year, month, 1)
    last_day = (first_day + 1.month) - 1.day

    month_array = [*first_day.day..last_day.day].map { |d| Time.zone.local(year, month, d) }
    calendarray = [[], [], [], [], []]
    i = 0
    month_array.each do |date|
      calendarray[i] << date
      i += 1 if date.saturday?
    end

    shrinked_calender = []
    calendarray.each do |week|
      shrinked_calender << (week.map { |d| d.day }).join(' ')
    end

    @reply_text = "Hello!!\n#{month_array.size}\n#{month_array.class}"
  end

end
