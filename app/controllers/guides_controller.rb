class GuidesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @q = Guide.ransack(tags_cont_any: params.fetch("search_entry").split(/[\s,'+-:~]/))
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
    @guide.tags = params.fetch("csi_section")+", "+params.fetch("title")+", "+params.fetch("discipline")
    
    if @guide.valid?
      @guide.save

      @tab = Tab.new
      @tab.title = "Design Summary"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Regulations"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Drawing Details"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Specifications"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Scheduling"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Cost Estimating"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Products/Suppliers"
      @tab.guide_id = @guide.id
      @tab.save

      @tab = Tab.new
      @tab.title = "Other Resources"
      @tab.guide_id = @guide.id
      @tab.save
      
      @tab = Tab.new
      @tab.title = "Discussions"
      @tab.guide_id = @guide.id
      @tab.save

      redirect_to("/guides/" + @guide.id.to_s, :notice => "Guide created successfully.")
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
    @guide.tags = params.fetch("csi_section")+", "+params.fetch("title")+", "+params.fetch("discipline")

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

    redirect_to("/", :notice => "Guide deleted successfully.")
  end
end
