class ReviewController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash]
  
  def list
    @user = User.find_by_email(session[:email])
    searchCate1Input = params[:searchCate1Input].to_i
    searchCate2Input = params[:searchCate2Input].to_i
    searchInput = params[:searchInput]
    searchCate1 = ""
    searchCate2 = ""
    
    case searchCate1Input
    when 2
      searchCate1 = "미용실후기"
    when 3
      searchCate1 = "미용제품후기"
    when 4
      searchCate1 = "셀프시술후기"
    when 5
      searchCate1 = "공지사항"
    end
    
    case searchCate2Input
    when 2
      searchCate2 = "title"
    when 3
      searchCate2 = "content"
    when 4
      searchCate2 = "userEmail"
    end
    
    if params[:searchCate1Input] == nil || searchCate2Input == 1
      @posts = Review.where("reviewType LIKE ?", "%#{searchCate1}%").where("title LIKE ? OR content LIKE ?", "%#{searchInput}%", "%#{searchInput}%")
    else
      @posts = Review.where("reviewType LIKE ? AND #{searchCate2} LIKE ?","%#{searchCate1}%","%#{searchInput}%")
    end
    @posts = @posts.page params[:page]
  end
    
  def show
    @user = User.where(:email => session[:email]).first
    @post = Review.where(:id => params[:id]).first
    @comments = Comment.where(:review_id => params[:id])
    @comments = @post.comments
  end
    
  def create
    post = Review.new
    post.reviewType = params[:category]
    post.title = params[:title]
    post.content = params[:content]
    post.imageURL = params[:imageURL]
    # puts current_user.email
    puts "hehe" if session[:email].nil?
    post.userEmail = session[:email]
    post.save
    redirect_to "/review/show/#{post.id}" 
  end
  
  def edit
    @user = User.where(:email => session[:email]).first
    @post = Review.where(:id => params[:id]).first
  end    
    
  def update
    @post = Review.where(:id => params[:id]).first
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to "/review/show/#{@post.id}"
  end
    
  def destroy
    @post = Review.where(:id => params[:id]).first
    @post. destroy
    redirect_to "/review/list"
  end

  def review_form
    @user = User.where(:email => session[:email]).first
    if session[:email] == nil
      flash[:warning] = '로그인 후 접근해주세요'
      redirect_to '/review/list'
    else 
    end
  end
  
  # before_action :authenticate_user!
  
  def like_toggle
    like= Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if like nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
    else
      like.destroy
    end
    
    redirect_to :back
  end
end
    