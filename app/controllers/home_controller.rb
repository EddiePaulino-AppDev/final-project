class HomeController < ApplicationController
    def index
        
      
    render("home/index.html.erb")
    end
    
    def search_entry
        
      
    render("topic/index.html.erb")
    end
    
end