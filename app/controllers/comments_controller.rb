class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end
  
  def create
   @article = Article.find_by_id(params[:id])
   @comment = @article.comments.new params[:comment]
   @comment.save
   flash[:notice] = 'Comment saved'
   redirect_to article_path(@article)    
  end
  
end
