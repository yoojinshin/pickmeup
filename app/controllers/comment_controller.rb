class CommentController < ApplicationController
  def create
    @comment = Comment.new
    @comment.userEmail = session[:email]
    @comment.body = params[:input_comment]
    @comment.review_id = params[:review_id]
    @comment.save
    redirect_to "/review/show/#{params[:review_id]}"
  end

  def destroy
    @comment = Comment.where(:id => params[:comment_id]).first
    r_id = @comment.review_id
    @comment.destroy
    redirect_to "/review/show/#{r_id}"
  end
end
