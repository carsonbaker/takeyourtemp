class ReadingsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create

    @reading = Reading.new(reading_params)

    verification = if Rails.env.production?
      verification = verify_recaptcha(model: @reading, action: "homepage")
    else
      true
    end

    if verification && @reading.save
      flash[:success] = "Temperature reading for Person #{@reading.household_person} recorded."

      @household_count = session[:household_count] || 1
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
      redirect_to '/'
    end

  end

  def cdc

  end

  def index
    @readings = Reading.order('created_at desc').limit(500).all
  end

  private

  def reading_params
    params.require(:reading).permit(:site, :zipcode, :sex, :temp_f, :age, :household_person, :browser_uuid, :sym_cough, :sym_short_breath, :sym_fatigue, :sym_sore_throat, :sym_runny_nose, :sym_aches, :sym_vomiting, :sym_diarrhea)
  end

end
