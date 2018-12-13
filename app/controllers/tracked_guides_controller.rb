class TrackedGuidesController < ApplicationController
    before_action :authenticate_user!
  def index
    @tracked_guides = TrackedGuide.all

    render("tracked_guide_templates/index.html.erb")
  end


  def create_row
    @tracked_guide = TrackedGuide.new

    @tracked_guide.user_id = params.fetch("user_id")
    @tracked_guide.guide_id = params.fetch("guide_id")

    if @tracked_guide.valid?
      @tracked_guide.save

      redirect_to("/guides/"+@tracked_guide.guide_id.to_s, :notice => "You are now tracking this guide.")
    else
      render("tracked_guide_templates/new_form.html.erb")
    end
  end



  def destroy_row
    @tracked_guide = TrackedGuide.find(params.fetch("id_to_remove"))

    @tracked_guide.destroy

    redirect_to("/guides/"+params.fetch("guide_id").to_s, :notice => "You are no longer tracking this guide.")
  end
end
