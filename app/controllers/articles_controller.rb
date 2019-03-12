class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index, :search]
  def index
    @articles = Article.all

    render("article_templates/index.html.erb")
  end

  def search
    @articles = Article.all
    @q = Article.ransack(params[:q])
      @articles = @q.result.includes(:industries, :disciplines)
    render("article_templates/search.html.erb")
  end

  def show
    @article = Article.find(params.fetch("id_to_display"))

    render("article_templates/show.html.erb")
  end

  def new_form
    render("article_templates/new_form.html.erb")
  end

  def create_row
    @article = Article.new

    @article.title = params.fetch("title")
    @article.author = params.fetch("author")
    @article.image = params.fetch("image","")
    @article.content = params.fetch("content")
    @article.user_id = params.fetch("user_id")
    @article.save
    
        #creating connect industries
    params.fetch("industries",{}).each do |industry|
    @connect_industry = ConnectIndustry.new
    @connect_industry.article_id = @article.id
    @connect_industry.industry_id = industry
    @connect_industry.save
    end

    #creating connect disciplines
    params.fetch("disciplines",{}).each do |discipline|
    @connect_discipline = ConnectDiscipline.new
    @connect_discipline.article_id = @article.id
    @connect_discipline.discipline_id = discipline
    @connect_discipline.save
    end

    if @article.valid?
      @article.save

      redirect_to("/articles", :notice => "Article created successfully.")
    else
      render("article_templates/new_form.html.erb")
    end
  end

  def edit_form
    @article = Article.find(params.fetch("prefill_with_id"))
    
    render("article_templates/edit_form.html.erb")
  end

  def update_row
    @article = Article.find(params.fetch("id_to_modify"))

    @article.title = params.fetch("title")
    @article.author = params.fetch("author")
    @article.image = params.fetch("image","")
    @article.content = params.fetch("content")
    @article.user_id = params.fetch("user_id")
    
    # updating industries
    ConnectIndustry.where(:article_id => @article.id).each do |connect_industry|
    connect_industry.destroy
    end
    params.fetch("industries",{}).each do |industry|
    @connect_industry = ConnectIndustry.new
    @connect_industry.article_id = @article.id
    @connect_industry.industry_id = industry
    @connect_industry.save
    end
    
    # updating disciplines
    ConnectDiscipline.where(:article_id => @article.id).each do |connect_discipline|
    connect_discipline.destroy
    end
    params.fetch("disciplines",{}).each do |discipline|
    @connect_discipline = ConnectDiscipline.new
    @connect_discipline.article_id = @article.id
    @connect_discipline.discipline_id = discipline
    @connect_discipline.save
    end

    if @article.valid?
      @article.save

      redirect_to("/articles/#{@article.id}", :notice => "Article updated successfully.")
    else
      render("article_templates/edit_form.html.erb")
    end
  end
  
  def upvote
    @article = Article.find(params.fetch("article_id"))
    @article.upvote_from current_user
    redirect_to("/articles/"+params.fetch("article_id"))
  end

  def downvote
      @article = Article.find(params.fetch("article_id"))
      @article.downvote_from current_user
      redirect_to("/articles/"+params.fetch("article_id"))
  end

  def destroy_row
    @article = Article.find(params.fetch("id_to_remove"))

    @article.destroy

    redirect_to("/articles", :notice => "Article deleted successfully.")
  end
end
