Rails.application.routes.draw do
  # Routes for the Article resource:

resources :comments, :only => [:create, :destroy]

  # CREATE
  get("/articles/new", { :controller => "articles", :action => "new_form" })
  post("/create_article", { :controller => "articles", :action => "create_row" })

  # READ
  get("/articles", { :controller => "articles", :action => "index" })
  get("/articles/search", { :controller => "articles", :action => "search"})
  get("/articles/:id_to_display", { :controller => "articles", :action => "show" })


  # UPDATE
  get("/articles/:prefill_with_id/edit", { :controller => "articles", :action => "edit_form" })
  post("/update_article/:id_to_modify", { :controller => "articles", :action => "update_row" })

  # DELETE
  get("/delete_article/:id_to_remove", { :controller => "articles", :action => "destroy_row" })
  
  # Voting articles
  post("/articles/:id/upvote", { :controller => "articles", :action => "upvote"})
  post("/articles/:id/downvote", { :controller => "articles", :action => "downvote"})
  #------------------------------

 # routes for comments

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })
  
  # Voting comments
  post("/comments/:id/upvote", { :controller => "comments", :action => "upvote"})
  post("/comments/:id/downvote", { :controller => "comments", :action => "downvote"})
  
  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })
  #------------------------------

  # Routes for the Discussion resource:

  # CREATE
  get("/discussions/new", { :controller => "discussions", :action => "new_form" })
  post("/create_discussion", { :controller => "discussions", :action => "create_row" })

  # READ
  get("/discussions", { :controller => "discussions", :action => "index" })
  get("/discussions/:id_to_display", { :controller => "discussions", :action => "show" })

  # UPDATE
  get("/discussions/:prefill_with_id/edit", { :controller => "discussions", :action => "edit_form" })
  post("/update_discussion/:id_to_modify", { :controller => "discussions", :action => "update_row" })

  # DELETE
  get("/delete_discussion/:id_to_remove", { :controller => "discussions", :action => "destroy_row" })

  #------------------------------

  mount Ckeditor::Engine => '/ckeditor'
  # Routes for the star resource:

  # CREATE
  post("/create_star", { :controller => "stars", :action => "create_row" })

  # READ
  get("/stars", { :controller => "stars", :action => "index" })

  # DELETE
  get("/delete_star/:id_to_remove", { :controller => "stars", :action => "destroy_row" })

  #------------------------------


 
  devise_for :users
   # Home screen
  # get("/",{:controller => "home", :action => "index"})
    root "home#index"
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

  # Routes for the Guide resource:

  # CREATE
  get("/guides/new", { :controller => "guides", :action => "new_form" })
  post("/create_guide", { :controller => "guides", :action => "create_row" })

  # READ
  get("/guides", { :controller => "guides", :action => "index" })
  get("/guides/:id_to_display", { :controller => "guides", :action => "show" })
  get("/guides/:id_to_display/:tab", { :controller => "guides", :action => "show" })

  # UPDATE
  get("/guides/:prefill_with_id/edit", { :controller => "guides", :action => "edit_form" })
  post("/update_guide/:id_to_modify", { :controller => "guides", :action => "update_row" })

  # DELETE
  get("/delete_guide/:id_to_remove", { :controller => "guides", :action => "destroy_row" })

  #------------------------------


    
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
