ActionController::Routing::Routes.draw do |map|
  map.resources :blog_groups do |blog_group|
    blog_group.resources :upload_files
  end
  map.resources :rsses
  map.resources :abouts
  map.resources :comments
  map.resources :blogs, :collection => { :example => :get, :list => :get, :reset_locale => :get }
  map.resources :chineses, :englishs
  map.resources :sessions
  map.resources :upload_files
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.root :controller => "blogs"
end
