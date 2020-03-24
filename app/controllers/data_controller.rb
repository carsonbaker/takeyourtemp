class DataController < ApplicationController

  before_action :authenticate

  def index
    @rows = []
    @rows << ["Tue, Mar 24 @ 1824 UTC", "2020-03-24_18-24-15.dump",
      "http://takeyourtemp.org.s3.amazonaws.com/2020-03-24_18-24-15.dump", 683, "postgres"]
    @rows << ["Mon, Mar 23 @ 1810 UTC", "2020-03-23_18-10-49.dump",
      "http://takeyourtemp.org.s3.amazonaws.com/2020-03-23_18-10-49.dump", 48, "postgres"]
  end

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == ENV['DATA_USERNAME'] && password == ENV['DATA_PASSWORD']
      end
    end
  end
  
end
