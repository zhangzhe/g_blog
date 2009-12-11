ActionController::Routing::Routes.draw do |map|
  map.resources :blogs #example
  map.resources :sessions
  map.resources :upload_files
  map.resources :upload_file_groups
  map.resources :versions
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.root :controller => "blogs"
end
