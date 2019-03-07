class CommentsController < ApplicationController
    before_action :authenticate_user!
  #def index
   # @comments = Comment.all

  #  render("comment_templates/index.html.erb")
 # end


  def create_row
    
    @comment = Comment.build_from( 
    if params.fetch("discussion_id","") == ""
    Article.find_by(:id => params.fetch("article_id"))
   else
    Discussion.find_by(:id => params.fetch("discussion_id"))
    end,
    current_user.id, params.fetch("body"))

    
    if @comment.valid?
      @comment.save

      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

 # def edit_form
  #  @comment = Comment.find(params.fetch("prefill_with_id"))

   # render("comment_templates/edit_form.html.erb")
  #end

#  def update_row
 #   @comment = Comment.find(params.fetch("id_to_modify"))

  #  @comment.user_id = params.fetch("user_id")
   # @comment.discussion_id = params.fetch("discussion_id")
  #  @comment.body = params.fetch("body")

   # if @comment.valid?
    #  @comment.save

     # redirect_to("/guides/"+params.fetch("guide_id"), :notice => "Comment updated successfully.")
    #else
     # @guide = Guide.find(params.fetch("guide_id"))
      #render("guide_templates/show.html.erb")
    #end
  #end
  
  def upvote
    @comment = Comment.find(params.fetch("comment_id"))
    @comment.upvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
      @comment = Comment.find(params.fetch("comment_id"))
      @comment.downvote_from current_user
      redirect_back(fallback_location: root_path)
  end

  def destroy_row
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_back(fallback_location: root_path)
  end
end