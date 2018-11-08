class SectionsController < ApplicationController
  def index
    @sections = Section.all

    render("section_templates/index.html.erb")
  end

  def show
    @section = Section.find(params.fetch("id_to_display"))

    render("section_templates/show.html.erb")
  end

  def new_form
    render("section_templates/new_form.html.erb")
  end

  def create_row
    @section = Section.new

    @section.topic_id = params.fetch("topic_id")

    if @section.valid?
      @section.save

      redirect_to("/sections", :notice => "Section created successfully.")
    else
      render("section_templates/new_form.html.erb")
    end
  end

  def edit_form
    @section = Section.find(params.fetch("prefill_with_id"))

    render("section_templates/edit_form.html.erb")
  end

  def update_row
    @section = Section.find(params.fetch("id_to_modify"))

    @section.topic_id = params.fetch("topic_id")

    if @section.valid?
      @section.save

      redirect_to("/sections/#{@section.id}", :notice => "Section updated successfully.")
    else
      render("section_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @section = Section.find(params.fetch("id_to_remove"))

    @section.destroy

    redirect_to("/sections", :notice => "Section deleted successfully.")
  end
end
