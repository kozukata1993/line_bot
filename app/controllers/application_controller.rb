class ApplicationController < ActionController::Base
  before_action :make_reply

  def make_reply
    year = Time.zone.now.year
    month = Time.zone.now.month
    day = Time.zone.now.day

    first_day = Time.zone.local(year, month, 1)
    last_day = (first_day + 1.month) - 1.day

    month_range = (first_day..last_day)
    calendarray = [[], [], [], [], []]

    if Time.zone.now.saturday?
      @reply_text = "Saturday"
    else
      @reply_text = "not Saturday"
    end

    # @reply_text = "Hello!!\n#{first_day}, #{last_day}"
  end

end
