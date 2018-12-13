class DiscussionsController < ApplicationController
    before_action :authenticate_user!
  def index
    @discussions = Discussion.all

    render("discussion_templates/index.html.erb")
  end

  def show
    @discussion = Discussion.find(params.fetch("id_to_display"))

    render("discussion_templates/show.html.erb")
  end

  def new_form
    render("discussion_templates/new_form.html.erb")
  end

  def create_row
    @discussion = Discussion.new

    @discussion.tab_id = params.fetch("tab_id")
    @discussion.guide_id = params.fetch("guide_id")
    @discussion.title = params.fetch("title")

    if @discussion.valid?
      @discussion.save

      redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Discussion created successfully.")
    else
      @guide = Guide.find(params.fetch("guide_id"))
      render("guide_templates/show.html.erb")
    end
  end

  def edit_form
    @discussion = Discussion.find(params.fetch("prefill_with_id"))

    render("discussion_templates/edit_form.html.erb")
  end

  def update_row
    @discussion = Discussion.find(params.fetch("id_to_modify"))

    @discussion.tab_id = params.fetch("tab_id")
    @discussion.guide_id = params.fetch("guide_id")
    @discussion.title = params.fetch("title")

    if @discussion.valid?
      @discussion.save

      redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Discussion updated successfully.")
    else
      @guide = Guide.find(params.fetch("guide_id"))
      render("guide_templates/show.html.erb")
    end
  end

  def destroy_row
    @discussion = Discussion.find(params.fetch("id_to_remove"))

    @discussion.destroy

    redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Discussion deleted successfully.")
  end
end
