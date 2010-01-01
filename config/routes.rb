ActionController::Routing::Routes.draw do |map|
  map.resources :blog_groups, :collection => { :all_content => :get} do |blog_group|
    blog_group.resources :upload_files
  end
  map.resources :rsses
  map.resources :comments
  map.resources :blogs, :collection => {:example => :get}
  map.resources :chineses, :englishs
  map.resources :sessions
  map.resources :upload_files
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.root :controller => "blog_groups"
end
