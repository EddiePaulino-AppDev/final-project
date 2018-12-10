class GuidesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @q = Guide.ransack(params[:q])
    @guides = @q.result(distinct: true)
    
    render("guide_templates/index.html.erb")
  end

  def show
    @guide = Guide.find(params.fetch("id_to_display"))

    render("guide_templates/show.html.erb")
  end

  def new_form
    render("guide_templates/new_form.html.erb")
  end

  def create_row
    @guide = Guide.new

    @guide.csi_section = params.fetch("csi_section")
    @guide.title = params.fetch("title")
    @guide.discipline = params.fetch("discipline")

    if @guide.valid?
      @guide.save

      @tab = Tab.new
      @tab.title = "Summary"
      @tab.guide_id = @guide.id
      @tab.save

      redirect_to("/guides", :notice => "Guide created successfully.")
    else
      render("guide_templates/new_form.html.erb")
    end
  end

  def edit_form
    @guide = Guide.find(params.fetch("prefill_with_id"))

    render("guide_templates/edit_form.html.erb")
  end

  def update_row
    @guide = Guide.find(params.fetch("id_to_modify"))

    @guide.csi_section = params.fetch("csi_section")
    @guide.title = params.fetch("title")
    @guide.discipline = params.fetch("discipline")

    if @guide.valid?
      @guide.save

      redirect_to("/guides/#{@guide.id}", :notice => "Guide updated successfully.")
    else
      render("guide_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @guide = Guide.find(params.fetch("id_to_remove"))

    @guide.destroy

    redirect_to("/guides", :notice => "Guide deleted successfully.")
  end
end
