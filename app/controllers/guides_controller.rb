class GuidesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
      @q = Guide.ransack(tags_cont_any: params.fetch("search_entry","").split(/[\s,'+-:~]/), industries_name_eq: params.fetch("industry",""), disciplines_name_eq: params.fetch("discipline",""), csi_section_eq: params.fetch("csi_section",""))
      @guides = @q.result.includes(:industries, :disciplines)
      #@guides = @guides.sort_by {|guide| [guide.created_at, guide.where(:tags => params.fetch("search_entry")).count]}.reverse

    render("guide_templates/index.html.erb")
  end

  def show
    @guide = Guide.find(params.fetch("id_to_display"))
    @instance_tab = params.fetch("tab","")

    if @instance_tab == ""
      @instance_tab ="Design Summary"
    end 

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
    
    #creating connect industries
    params.fetch("industries",{}).each do |industry|
    @connect_industry = ConnectIndustry.new
    @connect_industry.guide_id = @guide.id
    @connect_industry.industry_id = industry
    @connect_industry.save
    end

    #creating connect disciplines
    params.fetch("disciplines",{}).each do |discipline|
    @connect_discipline = ConnectDiscipline.new
    @connect_discipline.guide_id = @guide.id
    @connect_discipline.discipline_id = discipline
    @connect_discipline.save
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
      #create first discussion
      @discussion = Discussion.new
      @discussion.title = "Guide Development"
      @discussion.guide_id = @guide.id
      @discussion.tab_id = @tab.id
      @discussion.save

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
    ConnectIndustry.where(:guide_id => @guide.id).each do |connect_industry|
    connect_industry.destroy
    end
    params.fetch("industries",{}).each do |industry|
    @connect_industry = ConnectIndustry.new
    @connect_industry.guide_id = @guide.id
    @connect_industry.industry_id = industry
    @connect_industry.save
    end
    
    # updating disciplines
    ConnectDiscipline.where(:guide_id => @guide.id).each do |connect_discipline|
    connect_discipline.destroy
    end
    params.fetch("disciplines",{}).each do |discipline|
    @connect_discipline = ConnectDiscipline.new
    @connect_discipline.guide_id = @guide.id
    @connect_discipline.discipline_id = discipline
    @connect_discipline.save
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
