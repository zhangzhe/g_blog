class UserSession
  def initialize(session)
    @session = session
    @session[:locale] ||= :all
  end
  
  def locale=(locale)
    @session[:locale] = locale
  end
  
  def locale
    @session[:locale]
  end
end
