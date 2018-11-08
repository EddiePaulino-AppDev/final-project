class HomeController < ApplicationController
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