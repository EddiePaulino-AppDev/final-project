class ResourcesController < ApplicationController
    before_action :authenticate_user!
  def index
    @resources = Resource.all

    render("resource_templates/index.html.erb")
  end

  def show
    @resource = Resource.find(params.fetch("id_to_display"))

    render("resource_templates/show.html.erb")
  end

  def new_form
    render("resource_templates/new_form.html.erb")
  end

  def create_row
    @resource = Resource.new

    @resource.category = params.fetch("category")
    @resource.tab_id = params.fetch("tab_id")
    @resource.resource = params[:resource]

    if @resource.valid?
      @resource.save

      redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Resource created successfully.")
    else
      @guide = Guide.find(params.fetch("guide_id"))
      render("guide_templates/show.html.erb")
    end
  end

  def edit_form
    @resource = Resource.find(params.fetch("prefill_with_id"))

    render("resource_templates/edit_form.html.erb")
  end

  def update_row
    @resource = Resource.find(params.fetch("id_to_modify"))

    @resource.category = params.fetch("category")
    @resource.tab_id = params.fetch("tab_id")
    @resource.resource = params[:resource]

    if @resource.valid?
      @resource.save

      redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Resource updated successfully.")
    else
      @guide = Guide.find(params.fetch("guide_id"))
      render("guide_templates/show.html.erb")
    end
  end

  def destroy_row
    @resource = Resource.find(params.fetch("id_to_remove"))

    @resource.destroy

    redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Resource deleted successfully.")
  end
end
