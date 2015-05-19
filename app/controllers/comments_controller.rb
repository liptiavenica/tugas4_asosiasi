class CommentsController < ApplicationController
  def index
   @comments = Comment.all
  end

  def new
  @comment = Comment.new
  end

  def edit
  end
  
  def create
   @comment = Comment.new(comment_params)
   if @comment.save
     flash[:success] = 'Your comment was successfully added!'
     redirect_to article_url(params[:comment][:article_id])
   else
     render 'new'
   end
  end
 
 private
 
  def comment_params
    params.require(:comment).permit(:article_id, :content, :username)
  end
  
end
