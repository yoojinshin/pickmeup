class HomeController < ApplicationController
  add_flash_types :error, :another_custom_type
  def introduce
  end
  
  def login
    email = params[:email]
    password = params[:password]
    
    if email == '' || password == ''
      result = '/home/index/'
      flash[:warning] = 'Plz, Fill your Email or PW!'
    else
      
      user = User.find_by(:email => email).try(:authenticate, password)
      if user == nil
        result ='/home/index/'
        flash[:notice] = 'Plz, Check your Email!'
      else
        session[:email] = email
        session[:userType] = user.userType
        if user.userType == "user"
          result = "/home/basic_user"
        else
          result = "/home/basic_company"
        end
      end
    end
    redirect_to result
  end
  
# 고객 회원가입을 위한 액션

  def register_user
    user = User.find_by_email(params[:email])
    
    if user.present?
      redirect_to "/home/index", notice: '해당 email이 존재합니다' #해당 email이 존재하므로 로그인창으로
      
    else
      user = User.new
      user.userType = "user"
      user.email = params[:email]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      user.userName = params[:userName]
      user.phoneNum = params[:phoneNum]
      user.birth = params[:birth]
      user.gender = params[:gender]
      user.address = params[:address]
      user.save
      redirect_to '/home/index', notice: '회원가입이 완료되었습니다' #가입이 완료되었기에 로그인창으로
    end
  end
  
# 업체 회원가입을 위한 액션
  def register_company
    user = User.find_by_email(params[:email])
    
    if user.present?
      redirect_to '/home/index', notice: '해당 email이 존재합니다' #해당 email이 존재하므로 로그인창으로
    else
      user = User.new
      user.userType = "company"
      user.email = params[:email]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      user.userName = params[:userName]
      user.phoneNum = params[:phoneNum]
      user.birth = params[:birth]
      user.address = params[:address]
      user.save
      redirect_to '/home/index', notice: '회원가입이 완료되었습니다' #가입이 완료되었기에 로그인창으로
    end
  end
    
# 고객의 견적요청을 위한 액션
# user has_many request, request belongs_to user (1:N)

  def request_user
        
    
    # 로그인된 user의 정보도 포함되어야함
    user = User.where(:email => session[:email]).first
    estimate = Estimate.new
    estimate.userName = user.userName
    estimate.ago = params[:ago]
    estimate.style_ago = params[:style_ago]
    estimate.detail_ago = params[:detail_ago]
    estimate.behind_url = params[:behind]
    estimate.front_url = params[:front]
    estimate.damage_url = params[:damage]
    estimate.save
    redirect_to '/home/basic_user', notice: '견적요청이 완료되었습니다'

  end
  
# 업체의 견적요청확인을 위한 액션
  def request_company
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
    else
      flash[:warning] = '로그인 후 접근해주세요' 
      redirect_to '/home/index'
    end
    
    @estimate = Estimate.all
  end
  
# 견적요청 카드를 클릭했을 때의 show 액션
  def show_company
  end
  
  def basic_user
    
  end

  def basic_company
    
  end
  


  def review
  end

  def review_form
  end

  def hairshop
    
  end

  def hairshop_each
    
  end

  def mypage_user
    
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
    else
      flash[:warning] = '로그인 후 접근해주세요' 
      redirect_to '/home/index'
    end
  end

  def mypage_company
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
    else
      redirect_to '/home/index', alarm: "로그인 해주세요"
    end
  end
  
  def logout
    session[:email] = nil
    session[:userType] = nil
    redirect_to :root
  end
end
