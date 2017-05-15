class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.blog_id = params[:blog_id]
    if @comment.save
      flash.notice = "You commented on #{@comment.blog.title}"
      redirect_to blog_path(@comment.blog)
    else
      flash.notice = 'Error Writing Comment'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

end
