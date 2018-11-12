class HomeController < ApplicationController
before_action :authenticate_user!, :except => [:about_us, :search, :index]
    def index
    @topic = Topic.all
      
    render("home/index.html.erb", layout:false)
    end
    
    def search
    @topic = Topic.all
    
    render("home/search_results.html.erb")
    end
        
    def about_us
       
    render("home/about_us.html.erb") 
    end
    
end