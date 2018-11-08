class TopicsController < ApplicationController
  def index
    @topics = Topic.all

    render("topic_templates/index.html.erb")
  end

  def show
    @topic = Topic.find(params.fetch("id_to_display"))

    render("topic_templates/show.html.erb")
  end

  def new_form
    render("topic_templates/new_form.html.erb")
  end

  def create_row
    @topic = Topic.new

    @topic.csi_section = params.fetch("csi_section")
    @topic.title = params.fetch("title")
    @topic.engineering_discipline = params.fetch("engineering_discipline")

    if @topic.valid?
      @topic.save

      redirect_to("/topics", :notice => "Topic created successfully.")
    else
      render("topic_templates/new_form.html.erb")
    end
  end

  def edit_form
    @topic = Topic.find(params.fetch("prefill_with_id"))

    render("topic_templates/edit_form.html.erb")
  end

  def update_row
    @topic = Topic.find(params.fetch("id_to_modify"))

    @topic.csi_section = params.fetch("csi_section")
    @topic.title = params.fetch("title")
    @topic.engineering_discipline = params.fetch("engineering_discipline")

    if @topic.valid?
      @topic.save

      redirect_to("/topics/#{@topic.id}", :notice => "Topic updated successfully.")
    else
      render("topic_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @topic = Topic.find(params.fetch("id_to_remove"))

    @topic.destroy

    redirect_to("/topics", :notice => "Topic deleted successfully.")
  end
end
