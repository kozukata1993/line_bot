class ApplicationController < ActionController::Base
  before_action :make_reply

  def make_reply



    @reply_text = "Hello!!\n#{Time.zone.local(2019, 9, 2)}"
  end

end
