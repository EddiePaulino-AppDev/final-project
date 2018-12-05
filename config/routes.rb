Rails.application.routes.draw do
 
  mount Ckeditor::Engine => '/ckeditor'
  # Routes for the Resource resource:


resources :attachments, only: [:index, :new, :create, :destroy]

  # CREATE
  get("/resources/new", { :controller => "resources", :action => "new_form" })
  post("/create_resource", { :controller => "resources", :action => "create_row" })

  # READ
  get("/resources", { :controller => "resources", :action => "index" })
  get("/resources/:id_to_display", { :controller => "resources", :action => "show" })

  # UPDATE
  get("/resources/:prefill_with_id/edit", { :controller => "resources", :action => "edit_form" })
  post("/update_resource/:id_to_modify", { :controller => "resources", :action => "update_row" })

  # DELETE
  get("/delete_resource/:id_to_remove", { :controller => "resources", :action => "destroy_row" })

  #------------------------------

  devise_for :users
   # Home screen
  # get("/",{:controller => "home", :action => "index"})
    root "home#index"
  get("/topics/search",{:controller => "home", :action => "search"})
  get("/about_us",{:controller =>"home", :action =>"about_us"})
  
  # Routes for the Text component resource:

  # CREATE
  get("/text_components/new", { :controller => "text_components", :action => "new_form" })
  post("/create_text_component", { :controller => "text_components", :action => "create_row" })

  # READ
  get("/text_components", { :controller => "text_components", :action => "index" })
  get("/text_components/:id_to_display", { :controller => "text_components", :action => "show" })

  # UPDATE
  get("/text_components/:prefill_with_id/edit", { :controller => "text_components", :action => "edit_form" })
  post("/update_text_component/:id_to_modify", { :controller => "text_components", :action => "update_row" })

  # DELETE
  get("/delete_text_component/:id_to_remove", { :controller => "text_components", :action => "destroy_row" })



  #------------------------------

  # Routes for the Tab resource:

  # CREATE
  get("/tabs/new", { :controller => "tabs", :action => "new_form" })
  post("/create_tab", { :controller => "tabs", :action => "create_row" })

  # READ
  get("/tabs", { :controller => "tabs", :action => "index" })
  get("/tabs/:id_to_display", { :controller => "tabs", :action => "show" })

  # UPDATE
  get("/tabs/:prefill_with_id/edit", { :controller => "tabs", :action => "edit_form" })
  post("/update_tab/:id_to_modify", { :controller => "tabs", :action => "update_row" })

  # DELETE
  get("/delete_tab/:id_to_remove", { :controller => "tabs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Topic resource:

  # CREATE
  get("/topics/new", { :controller => "topics", :action => "new_form" })
  post("/create_topic", { :controller => "topics", :action => "create_row" })

  # READ
  get("/topics", { :controller => "topics", :action => "index" })
  get("/topics/:id_to_display", { :controller => "topics", :action => "show" })

  # UPDATE
  get("/topics/:prefill_with_id/edit", { :controller => "topics", :action => "edit_form" })
  post("/update_topic/:id_to_modify", { :controller => "topics", :action => "update_row" })

  # DELETE
  get("/delete_topic/:id_to_remove", { :controller => "topics", :action => "destroy_row" })

  #------------------------------


    
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
