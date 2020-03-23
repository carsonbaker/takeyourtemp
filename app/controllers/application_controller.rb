class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def forbidden(reason)
    raise ActionController::BadRequest.new(reason)
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
    
end
