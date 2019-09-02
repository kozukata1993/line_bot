class ApplicationController < ActionController::Base
  before_action :make_reply

  def make_reply



    @reply_text = "Hello!!\n#{Time.zone.now.class}"
  end

end
