class TextComponentsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @text_components = TextComponent.all

    render("text_component_templates/index.html.erb")
  end

  def show
    @text_component = TextComponent.find(params.fetch("id_to_display"))

    render("text_component_templates/show.html.erb")
  end

  def new_form
    render("text_component_templates/new_form.html.erb")
  end

  def create_row
    @text_component = TextComponent.new

    @text_component.tab_id = params.fetch("tab_id")
    @text_component.content = params.fetch("content")

    if @text_component.valid?
      @text_component.save

      redirect_to("/guides/" + params.fetch("guide_id"), :notice => "Text component created successfully.")
    else
      @guide = Guide.find(params.fetch("guide_id"))
      render("guide_templates/show.html.erb")
    end
  end

  def edit_form
    @text_component = TextComponent.find(params.fetch("prefill_with_id"))

    render("text_component_templates/edit_form.html.erb")
  end

  def update_row
    @text_component = TextComponent.find(params.fetch("id_to_modify"))

    @text_component.tab_id = params.fetch("tab_id")
    @text_component.content = params.fetch("content")

    if @text_component.valid?
      @text_component.save

      redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Text component updated successfully.")
    else
      @guide = Guide.find(params.fetch("guide_id"))
      render("guide_templates/show.html.erb")
    end
  end

  def destroy_row
    @text_component = TextComponent.find(params.fetch("id_to_remove"))

    @text_component.destroy

    redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Text component deleted successfully.")
  end
end
