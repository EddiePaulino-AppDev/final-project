class StarsController < ApplicationController
    before_action :authenticate_user!
  def index
    @stars = Star.all

    render("star_templates/index.html.erb")
  end


  def create_row
    @star = Star.new

    @star.user_id = params.fetch("user_id")
    @star.guide_id = params.fetch("guide_id")

    if @star.valid?
      @star.save

      redirect_to("/guides/"+@star.guide_id.to_s, :notice => "You are now tracking this guide.")
    else
      render("star_templates/new_form.html.erb")
    end
  end



  def destroy_row
    @star = Star.find(params.fetch("id_to_remove"))

    @star.destroy

    redirect_to("/guides/"+params.fetch("guide_id").to_s, :notice => "You are no longer tracking this guide.")
  end
end
