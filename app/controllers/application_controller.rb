class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper :application
  before_action :set_locale

  def set_locale
    unless session[:locale]
      I18n.locale = 'no'
      session[:locale] = 'no'
    end
    I18n.locale = session[:locale]
    if params[:locale] =~/en|no/
      I18n.locale = params[:locale]
      session[:locale] = params[:locale]
    end
  end

end
