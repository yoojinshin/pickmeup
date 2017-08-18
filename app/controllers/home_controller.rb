class HomeController < ApplicationController
  add_flash_types :error, :another_custom_type
  
  def introduce
  end
  
  def index
    # 이미 로그인한사람이 다시 로그인창에 들어간 경우
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
      if @user.userType == "user"
        redirect_to "/home/basic_user"
      else
        redirect_to "/home/basic_company"
      end
    end
  end
  
  def login
      email = params[:email]
      password = params[:password]
      
      if email == '' || password == ''
        result = '/home/index/'
        flash[:warning] = 'Plz, Fill your Email or PW!'
      else
        user = User.find_by(:email => email)
        if user == nil
          result ='/home/index/'
          flash[:notice] = 'Plz, Check your Email!'
        elsif user.try(:authenticate, password)
          session[:email] = email
          session[:userType] = user.userType
          if user.userType == "user"
            result = "/home/basic_user"
          else
            result = "/home/basic_company"
          end
        else
          result="/home/index/"
          flash[:warning] = 'Plz, Check your PW!'
        end
      end
      redirect_to result
  end
  
# 회원가입을 위한 액션

  def register_user
    user = User.find_by_email(params[:email])
    
    if user.present?
      redirect_to "/home/index", alert: '해당 email이 존재합니다' #해당 email이 존재하므로 로그인창으로
      
    else
      user = User.new
      user.userType = params[:userType]
      user.email = params[:email]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      user.userName = params[:userName]
      user.phoneNum = params[:phoneNum]
      user.birth = params[:birth]
      user.gender = params[:gender]
      user.address = params[:address]
      user.save
      # render params[:address]
      redirect_to '/home/congratulations_register', notice: '회원가입이 완료되었습니다' #가입이 완료되었기에 로그인창으로
    end
  end
  
# 업체 등록을 위한 액션

  
  def register_company
    @user = User.where(:email => session[:email]).first
    company=Company.new
    company.companyName=params[:companyName]
    company.companyPhone=params[:companyPhone]
    company.companyBirth=params[:companyBirth]
    company.companyNum=params[:companyNum]
    company.imageURL=params[:imageURL]
    company.menuURL=params[:menuURL]
    company.storeURL=params[:storeURL]
    company.numStaff=params[:numStaff]
    company.userEmail = session[:email]
    company.numStaff = params[:numStaff]
    company.companyAddress = params[:companyAddress]
    company.companyIntro = params[:companyIntro]
    company.save
    redirect_to '/home/mypage_company/', notice: '업체등록이 완료되었습니다.'
  end
    
# 고객의 견적요청을 위한 액션
  def request_user
    @user=User.where(:email => session[:email]).first
  end
  
  def estimate_user
    if session[:email] != nil
      user = User.where(:email => session[:email]).first
      estimate = Request.new
      estimate.userEmail = user.email
      estimate.ago = params[:ago]
      if estimate.ago != nil
        estimate.styleAgo = params[:styleAgo]
        
        ary = []
        styleAry = []
        styleAry = params[:styleAgo]
        styleAgoAry = []
        for i in 0..(styleAry.length-1)
          ary.push(styleAry[i])
          param1 = styleAry[i]+"TimesInput"
          param2 = styleAry[i]+"Explanation"
          ary.push(params["#{param1}"])
          ary.push(params["#{param2}"])
          styleAgoAry.push(ary.pop(ary.length))
        end
        # i = 0
        # styleAgoAry.each do |s|
        #   param1 = styleAry[i]+"TimesInput"
        #   param2 = styleAry[i]+"Explanation"
        #   s[0] = styleAry[i]
        #   s[1] = params["#{param1}"]
        #   s[2] = params["#{param2}"]
        #   i += 1
        # end
        estimate.detailAgo = styleAgoAry
      end
      
      estimate.backURL = params[:back]
      estimate.frontURL = params[:front]
      estimate.damageURL = params[:damage]
      estimate.style = params[:style]
      estimate.styleURL = params[:styleURL]
      estimate.detail = params[:detail]
      estimate.wannaGo = params[:wannaGo]
      estimate.save
      redirect_to '/home/request_confirm_user', notice: '견적요청이 완료되었습니다'
    else
      flash[:warning] = '로그인 후 접근해주세요'
      redirect_to '/home/index'
    end
  end
  
#견적요청 확인 페이지
  def request_confirm_user
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
      @estimates = Request.where(:userEmail => session[:email]).includes(:responses)
    else
      flash[:warning] = '로그인 후 접근해주세요'
      redirect_to '/home/index'
    end
  end
  
  
# 업체의 견적요청확인을 위한 액션
  def request_confirm_company
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
      @estimates = Request.all
    else
      flash[:warning] = '로그인 후 접근해주세요'
      redirect_to '/home/index'
    end
  end


  # 견적요청 카드를 클릭했을 때의 show 액션
  def show_company
    id = params[:id]
    re = Request.find(id)

    json = {
      "ago" => re.ago,
      "userEmail" => re.userEmail,
      "styleAgo" => re.styleAgo,
      "detailAgo" => re.detailAgo,
      "backURL" => re.backURL,
      "frontURL" => re.frontURL,
      "damageURL" => re.damageURL,
      "style" => re.style,
      "detail" => re.detail,
      "wannaGo" => re.wannaGo
    }
    render json: json
  end
  
# 견적을 보기위한 액션
  def show_response
    @user = User.where(:email => session[:email]).first
    @response = Response.where(:id => params[:id]).first
  end
  
# 예약을 위한 액션

  def reserve_apply
    reserveCheck= {
      :check => true
    }
    @reservation = Reserve.new
    @reservation.customerEmail = session[:email]
    @reservation.reserveDay = params[:reserveDay]
    @reservation.reserveTime = params[:reserveTime]
    @reservation.reserveCheck = "신청완료"
    @reservation.response_id = params[:responseId]
    @reservation.save
    render json: reserveCheck
  end
  
  def reserve_user
    @user = User.where(:email => session[:email]).first
    @reservations = Reserve.where(:customerEmail => session[:email])
  end
  
  def reserve_company
    @user = User.where(:email => session[:email]).first
    @reservation = Reserve.where(:companyEmail => session[:email])  end
  
  def reserve_confirm
    @reservation = Reserve.where(:id => params[:id])
    # @reservation.reserveCheck = 1
  end
  
# 업체 견적을 위한 액션
  def request_company
    if session[:email] != nil
      @user = User.where(:email => session[:email]).first
      @company = Company.where(:userEmail => session[:email]).first
      @estimate = Request.where(:id => params[:id]).first
    end
  end
  
  def estimate_company
    @company = Company.where(:userEmail => session[:email]).first
    @response = Response.new
    @response.companyName = @company.companyName
    @response.companyURL = @company.storeURL
    @response.content = params[:content]
    @response.request_id = params[:id]
    @response.save
    redirect_to '/home/request_confirm_company'
  end
  

  def basic_user
    @user = User.where(:email => session[:email]).first
  end

  def basic_company
    @user = User.find_by_email(session[:email]);
    @company = Company.find_by_userEmail(session[:email]);
    if @company == nil
      @isCreated = "no"
    else
      @isCreated = @company.companyName
    end
  end
  
  def hairshop
    @user = User.find_by_email(session[:email])
    searchCate1Input = params[:searchCate1Input].to_i
    searchInput = params[:searchInput]
    searchCate1 = ""
    
    case searchCate1Input
    when 1
      searchCate1 = "companyName"
    when 2
      searchCate1 = "companyAddress"
    end
    
    if searchInput == nil
      @companies = Company.all
    else
      @companies = Company.where("#{searchCate1} LIKE ?", "%#{searchInput}%")
    end
    @companies = @companies.page params[:page]
    
    @users=User.all
  end

  def hairshop_each
    @user = User.where(:email => session[:email]).first
    @company= Company.find(params[:company_id])
  end
  
  def hairshop_each2

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
      @company = Company.find_by_userEmail(session[:email])
    else
      redirect_to '/home/index', alarm: "로그인 해주세요"
    end
  end
  
# 로그아웃 액션
  def logout
    session[:email] = nil
    session[:userType] = nil
    session.clear
    redirect_to '/home/index'
  end
  
  def emailConfirm
    email = params[:email]
    emailConfirm= {
      "confirm" => true
    }
    if email == ""
      emailConfirm[:confirm] = true
    elsif User.exists?(email: email)
      emailConfirm[:confirm] = true
    else
      emailConfirm[:confirm] = false
    end
    render json: emailConfirm
  end
  
# 견적요청 삭제 액션
  def destroy
    @estimate = Request.where(:id => params[:id]).first
    @estimate.destroy
    redirect_to "/home/request_confirm_user"
  end
  
  
# 탈퇴를 위한 액션
  def sign_out
    user = User.find_by_email(session[:email])
    if user.userType == "company"
      if Company.exists?(:userEmail => user.email)
        Company.find_by_userEmail(user.email).destroy
      end
    end
    user.destroy
    
    session.clear
    redirect_to '/home/index'
  end
  
  def signOutConfirm
    passwordCheck= {
      :check => false
    }
    
    user = User.find_by(:email => session[:email])
    if user.try(:authenticate, params[:password])
      passwordCheck[:check] = true 
    end
    
    render json: passwordCheck
  end
end
