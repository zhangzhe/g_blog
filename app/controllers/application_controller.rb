class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  helper_method :admin?
  before_filter :set_locale
  filter_parameter_logging "password"
  
  def authorize
    redirect_to root_path unless admin?
  end
  
  def admin?
    session[:password] == Password.first.password
  end
  
  def user_session
    @user_session ||= UserSession.new(session)
  end
  
  def save_locale(locale)
    user_session.locale = locale
    I18n.locale = locale
  end
  
  def set_locale
    I18n.locale = user_session.locale || :all
  end
end
