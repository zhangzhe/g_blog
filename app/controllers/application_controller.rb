class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  helper_method :admin?

  def admin?
    session[:password] == '1234123'
  end
end
