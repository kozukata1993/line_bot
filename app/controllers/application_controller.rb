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
      calendarray[i] << date
      i += 1 if date.saturday?
    end

    # calendar_range_array = calendar_array.map do |week|
    #   (week[0]...(week[week.size - 1] + 1.day))
    # end



    # shrinked_calender = []
    # calendarray.each do |week|
    #   shrinked_calender << (week.map { |d| d.day }).join(' ')
    # end

    @reply_text = "Hello!!"
  end

end
