class TopicController < ApplicationController
    def index
    @topic = Topic.all     
      
    render("home/index.html.erb")
    end
    
    def show
    @topic = Topic.find(params.fetch("id"))     
    
    render("topic/show.html.erb")
    end
    
    def new_form
        
    render("topic/new_form.html.erb")
    end
    
    def create_row
    @topic = Topic.new
    @topic.title = params.fetch("title")
    @topic.text1 = params.fetch("text1")
    @topic.save
    
    redirect_to("/topic/"+@topic.id.to_s, :notice =>"Topic created successfully")
    end
    
    def edit_form
    @topic = Topic.find(params.fetch("id"))
    
    render("/topic/edit_form.html.erb")
    end

    def destroy_row
    @topic = Topic.find(params.fetch("id"))
    @topic.destroy
    
    redirect_to("/", :notice =>"Topic deleted successfully") 
    end

end