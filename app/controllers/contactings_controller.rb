class ContactingsController < ApplicationController

  def new
    @contacting = Contacting.new 
  end

  def create
    @contacting = Contacting.new(contactings_params)
    if @contacting.valid?
      ContactingMailer.hello(@contacting).deliver
      redirect_to success_contactings_path
    else
      flash[:error] = "Message could not be delivered."
      redirect_to new_contacting_path
    end
  end
  
  private

  def contactings_params
    params.require(:contacting).permit(:from, :message)
  end

end
