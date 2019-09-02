class ApplicationController < ActionController::Base
  before_action :make_reply

  def make_reply
    year = Time.zone.now.year
    month = Time.zone.now.month
    day = Time.zone.now.day

    first_day = Time.zone.local(year, month, 1)
    last_day = (first_day << - 1) - 1


    @reply_text = "Hello!!\n#{first_day}, #{last_day}"
  end

end
