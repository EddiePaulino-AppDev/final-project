Rails.application.routes.draw do
  get("/",{:controller => "home", :action => "index"})
  get("/index",{:controller => "home", :action => "index"})
  
  
  get("/topic/:id",{:controller => "topic", :action => "show"})
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
