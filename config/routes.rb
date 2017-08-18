Rails.application.routes.draw do
  resources :posts
  root 'home#introduce'
  
  get 'review/reviewpage'

  #첫 화면(웹서비스 소개페이지)
  get 'home/introduce'

  get 'home/basic_user'

  get 'home/basic_company'
  
  get '/home/logout' => 'home#logout'
  
  get 'home/request_confirm_user' => 'home#request_confirm_user'

  post '/register_user' => 'home#register_user'
  
  get 'home/index' => 'home#index'
  
  get 'home/congratulations_register'
  
# 견적요청 페이지(고객)
  get 'home/request_user'
  
  get 'home/request_user' => 'home#request_user'
 
  post '/estimate_user' => 'home#estimate_user'
  
  get 'home/basic_user' => 'home#basic_user'
  
# 견적요청 확인페이지(고객)
  get 'home/request_confirm_user'
  
  get 'home/show_confirm'
  
  get 'home/show_response/:id' => 'home#show_response'
  
  post 'home/destroy/:id' => 'home#destroy'
  
# 견적요청 확인 페이지(업체)
  get 'home/request_confirm_company'
  
  get 'home/request_confirm_company' => 'home#request_confirm_company'

  get 'home/basic_company' => 'home#basic_company'
  
# 견적내주는 페이지(업체)
  get 'home/request_company'
  
  get 'home/request_company/:id' => 'home#request_company'
  
  get 'home/estimate_company'

  post 'home/estimate_company/:id' => 'home#estimate_company'
  
  # 예약을 위한 페이지
  get 'home/reserve_user'
  
  get 'home/reserve_user/:id' => 'home#reserve_user'
  
  get 'home/reserve_company'
  
  post 'home/reserve_apply' => 'home#reserve_apply'
  
# 리뷰게시판
  # review
  ## list
  get '/review/list'
  
  ## create
  post '/review/create' => 'review#create'
 
  ## show
  get '/review/show/:id' => 'review#show'
  
  ## edit
  get '/review/edit/:id' => 'review#edit'
  
  ## update
  post '/review/update/:id' => 'review#update'
  
  ## destroy
  post '/review/destroy/:id' => 'review#destroy'

  get 'review/review_form' => 'review#review_form'
  
  # comments
  ## create
  get 'comment/create'
  post '/comment/create/:review_id' => 'comment#create'

  ## destroy
  get 'comment/destroy'
  post '/comment/destroy/:comment_id' => 'comment#destroy'

#모든 미용실 정보를 카드 게시판 형태로 보여주는 페이지

  get 'home/hairshop'  => 'home#hairshop' 
  
  get 'home/hairshop_each/:company_id'=> 'home#hairshop_each'
  
  get 'home/hairshop_each/:user_id' => 'home#hairshop_each2'

#특정 미용실만 보는 페이지
 

  get 'home/mypage_user' => 'home#mypage_user'

  get 'home/mypage_company' => 'home#mypage_company'
  
  get 'home/index'

  post 'home/login' => 'home#login'

  get '/logout' => 'home#logout'
  
  get 'home/sign_up_user'

  
  # 업체 등록
  
  get 'home/company_register'
  
  post '/company_register' => 'home#register_company'
  
  
  # 이메일 중복체크
  post 'home/emailConfirm' => 'home#emailConfirm'
  
  post 'home/signOutConfirm' => 'home#signOutConfirm'
  
  get 'home/sign_out' => 'home#sign_out'
  
  # 리뷰게시판 좋아요
  

  get 'home/test'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end