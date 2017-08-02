class ReviewController < ApplicationController
  def new
  end
    
  def list
    @posts  = Review.all
  end
    
  def show
    @post =Review.find(params[:id])
    @comments=@post.comments
  end
    
  def create
    Review.create(title: params[:title], content: params[:content])
    redirect_to "/posts/show/#{@post.id}"
  end
    
  def edit
    @post = Review.find(params[:post_id])
  end    
    
  def update
    @post = Review.find(params[:post_id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to "/posts/show/#{@post.id}"
  end
    
  def destroy
    @post = Review.find(params[:post_id])
    @post. destroy
    redirect_to "/"
  end
    
  def comment
    comment=Comment.new
    comment.body=params[:body]
    comment.post_id=params[:id]
    comment.save
    redirect_to '/home/show/'+ params[:id]
    # redirect_to : back
  end
end
    