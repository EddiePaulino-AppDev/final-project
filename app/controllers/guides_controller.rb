class GuidesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
      @q = Guide.ransack(tags_cont_any: params.fetch("search_entry","").split(/[\s,'+-:~]/), industries_name_eq: params.fetch("industry",""), disciplines_name_eq: params.fetch("discipline",""), csi_section_eq: params.fetch("csi_section",""))
      @guides = @q.result.includes(:industries, :disciplines)

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

    @guide.csi_section = params.fetch("csi_section","")
    @guide.title = params.fetch("title")
    @guide.save
    
    #creating guide industries
    params.fetch("industries",{}).each do |industry|
    @guide_industry = GuideIndustry.new
    @guide_industry.guide_id = @guide.id
    @guide_industry.industry_id = industry
    @guide_industry.save
    end

    #creating guide disciplines
    params.fetch("disciplines",{}).each do |discipline|
    @guide_discipline = GuideDiscipline.new
    @guide_discipline.guide_id = @guide.id
    @guide_discipline.discipline_id = discipline
    @guide_discipline.save
    end
    
    @guide.tags = params.fetch("title")
    

    if @guide.valid?
      @guide.save

      @tab = Tab.new
      @tab.title = "Design Summary"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

      @tab = Tab.new
      @tab.title = "Regulations"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

      @tab = Tab.new
      @tab.title = "Drawing Details"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

      @tab = Tab.new
      @tab.title = "Specifications"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

      @tab = Tab.new
      @tab.title = "Scheduling"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

      @tab = Tab.new
      @tab.title = "Cost Estimating"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

      @tab = Tab.new
      @tab.title = "Products/Suppliers"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save
      
      @tab = Tab.new
      @tab.title = "Other Resources"
      @tab.guide_id = @guide.id
      @tab.save
      @text_component = TextComponent.new
      @text_component.content = nil
      @text_component.tab_id = @tab.id
      @text_component.save

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

    @guide.csi_section = params.fetch("csi_section", "")
    @guide.title = params.fetch("title")
    
    # updating industries
    GuideIndustry.where(:guide_id => @guide.id).each do |guide_industry|
    guide_industry.destroy
    end
    params.fetch("industries",{}).each do |industry|
    @guide_industry = GuideIndustry.new
    @guide_industry.guide_id = @guide.id
    @guide_industry.industry_id = industry
    @guide_industry.save
    end
    
    # updating disciplines
    GuideDiscipline.where(:guide_id => @guide.id).each do |guide_discipline|
    guide_discipline.destroy
    end
    params.fetch("disciplines",{}).each do |discipline|
    @guide_discipline = GuideDiscipline.new
    @guide_discipline.guide_id = @guide.id
    @guide_discipline.discipline_id = discipline
    @guide_discipline.save
    end
    
    #
    
    @guide.tags =  params.fetch("title") 

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
