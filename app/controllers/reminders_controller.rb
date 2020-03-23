class RemindersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.hour_of_day = Time.now.in_time_zone("UTC").hour

    if @reminder.valid?
      # Delete any existing reminders and replace them
      Reminder.where(email: @reminder.email).destroy_all
      Reminder.where(phone: @reminder.phone).destroy_all
    end

    if @reminder.save
      flash.now[:success] = "A reminder has been created."
      render 'show' 
    else
      flash.now[:error] = "A reminder could not be created."
      render 'new'
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(:email, :phone)
  end

end
