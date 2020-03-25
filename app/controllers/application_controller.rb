class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def forbidden(reason)
    raise ActionController::BadRequest.new(reason)
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
    
  before_action :best_locale_from_request!

  def best_locale_from_request!
    I18n.locale = best_locale_from_request
  end

  def best_locale_from_request
    return I18n.default_locale unless request.headers.key?('HTTP_ACCEPT_LANGUAGE')

    string = params[:lang] || request.headers.fetch('HTTP_ACCEPT_LANGUAGE')
    locale = AcceptLanguage.intersection(string, I18n.default_locale, *I18n.available_locales)

    # If the server cannot serve any matching language,
    # it can theoretically send back a 406 (Not Acceptable) error code.
    # But, for a better user experience, this is rarely done and more
    # common way is to ignore the Accept-Language header in this case.
    return I18n.default_locale if locale.nil?

    locale
  end

end
