ActionController::Routing::Routes.draw do |map|

  map.resources :addresses, :only => :destroy
  map.resources :cities, :only => :index
  map.resources :companies, :has_many => :people
  map.resources :contacts, :only => :index
  map.resources :countries, :only => :index
  map.resources :emails, :only => :destroy
  map.resources :instant_messengers, :only => :destroy
  map.resources :people
  map.resources :phones, :only => :destroy
  map.resources :provinces, :only => :index
  map.resources :websites, :only => :destroy

end
