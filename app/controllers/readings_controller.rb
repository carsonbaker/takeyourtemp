class ReadingsController < ApplicationController

  skip_before_action :verify_authenticity_token
  after_action :set_browser_uuid

  def index

    household_person = (params[:p] ||= 1).to_i
    @household_count = session[:household_count] || 1

    if session[:browser_uuid]
      # Return visit
      @prev = Reading.where(
        browser_uuid: session[:browser_uuid],
        household_person: household_person).order('id desc').first
    end

    @reading = Reading.new(household_person: household_person)

  end

  def add_person
    session[:household_count] ||= 1
    session[:household_count] += 1
    redirect_to root_path
  end

  def create

    @reading = Reading.new(reading_params)
    @household_count = session[:household_count] || 1

    verification = if Rails.env.production?
      verification = verify_recaptcha(model: @reading, action: "homepage")
    else
      true
    end

    if verification && @reading.save
      flash[:success] = "Temperature reading for Person #{@reading.household_person} recorded."

      next_person_i = (@reading.household_person + 1) 
      if next_person_i >= @household_count
        next_person_i = 1
      end

      if @household_count == 1
        redirect_to "/cdc"
      else
        redirect_to "/?p=#{next_person_i}"
      end

    else

      flash[:error] = "Temperature reading could not be recorded."
      render 'index'
    end

  end

  def cdc

  end

  def debug
    @readings = Reading.order('created_at desc').limit(500).all
  end

  private

  def set_browser_uuid
    session[:browser_uuid] = SecureRandom.uuid unless session[:browser_uuid]
  end

  def reading_params
    params.require(:reading).permit(:site, :zipcode, :sex, :temp_f, :age, :household_person, :browser_uuid, :sym_cough, :sym_short_breath, :sym_fatigue, :sym_sore_throat, :sym_runny_nose, :sym_aches, :sym_vomiting, :sym_diarrhea)
  end

end
