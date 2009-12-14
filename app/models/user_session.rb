class UserSession
  def initialize(session)
    @session = session
    @session[:locale] ||= :en
  end
  
  def locale=(locale)
    @session[:locale] = locale
  end
  
  def locale
    @session[:locale]
  end
end
