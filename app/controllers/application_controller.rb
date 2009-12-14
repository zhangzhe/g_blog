class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  helper_method :admin?
  before_filter :set_locale
  
  def admin?
    session[:password] == '1234123'
  end
  
  def user_session
    @user_session ||= UserSession.new(session)
  end
  
  def save_locale(locale)
    user_session.change_locale(locale)
    I18n.locale = locale
  end
  
  def set_locale
    I18n.locale = user_session.locale
  end
end
