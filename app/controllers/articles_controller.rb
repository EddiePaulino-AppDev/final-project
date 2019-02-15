class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  def index
    @articles = Article.all

    render("article_templates/index.html.erb")
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
    @article.image = params.fetch("image",@article.image)
    @article.content = params.fetch("content")
    @article.user_id = params.fetch("user_id")


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
