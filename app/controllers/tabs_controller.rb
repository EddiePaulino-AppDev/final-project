class TabsController < ApplicationController
   before_action :authenticate_user!, :except => [:show, :index]
   
  def index
    @tabs = Tab.all

    render("tab_templates/index.html.erb")
  end

  def show
    @tab = Tab.find(params.fetch("id_to_display"))

    render("tab_templates/show.html.erb")
  end

  def new_form
    render("tab_templates/new_form.html.erb")
  end

  def create_row
    @tab = Tab.new

    @tab.title = params.fetch("title")
    @tab.topic_id = params.fetch("topic_id")

    if @tab.valid?
      @tab.save

      redirect_to("/topics/"+params.fetch("topic_id"), :notice => "Tab created successfully.")
    else
      render("tab_templates/new_form.html.erb")
    end
  end

  def edit_form
    @tab = Tab.find(params.fetch("prefill_with_id"))

    render("tab_templates/edit_form.html.erb")
  end

  def update_row
    @tab = Tab.find(params.fetch("id_to_modify"))

    @tab.title = params.fetch("title")
    @tab.topic_id = params.fetch("topic_id")

    if @tab.valid?
      @tab.save

      redirect_to("/topics/"+params.fetch("topic_id"), :notice => "Tab updated successfully.")
    else
      render("tab_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @tab = Tab.find(params.fetch("id_to_remove"))

    @tab.destroy

    redirect_to("/topics/"+@tab.topic_id.to_s, :notice => "Tab deleted successfully.")
  end
end
