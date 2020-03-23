class MainController < ApplicationController
  
  def index

    params[:p] ||= 1
    @household_person = params[:p].to_i

    if session[:browser_uuid]
      # Return visit
      @browser_uuid = session[:browser_uuid]
      @household_count = session[:household_count] || 1
      @prev = Reading.where(
        browser_uuid: @browser_uuid,
        household_person: @household_person).order('id desc').first
    else
      # First visit
      @household_count = 1
      @browser_uuid = SecureRandom.uuid
      session[:browser_uuid] = @browser_uuid
    end

    @reading = Reading.new

  end

  def add_person
    session[:household_count] ||= 1
    session[:household_count] += 1
    redirect_to root_path
  end

end
