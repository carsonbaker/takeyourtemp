class DataController < ApplicationController

  before_action :authenticate

  def index

  end

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == ENV['DATA_USERNAME'] && password == ENV['DATA_PASSWORD']
      end
    end
  end
  
end
