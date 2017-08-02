Rails.application.routes.draw do
  
  resources :posts
  root 'home#introduce'
  
  get 'review/reviewpage'

  #첫 화면(웹서비스 소개페이지)
  get 'home/introduce'

  get 'home/basic_user'

  get 'home/basic_company'
  
# 회원가입 첫페이지
  
  get 'home/register_intro'
  
  get 'home/register_user' => 'home#register_user'
  
  get 'home/register_company' => 'home#register_company'
  
# 회원가입 페이지(고객)

  get 'home/register_user'
  
  post '/register_user' => 'home#register_user'
  
  get 'home/index' => 'home#index'
  
# 회원가입 페이지(업체)
  get 'home/register_company'
  
  post '/register_company' => 'home#register_company'
  
  get 'home/congratulations_register'
# 견적요청 페이지(고객)
  get 'home/request_user'
 
  post '/request_user' => 'home#request_user'
  
  get 'home/basic_user' => 'home#basic_user'
  
# 견적요청 확인 페이지(업체)
  get 'home/request_company'
  
  post '/request_company' => 'home#request_company'

  get 'home/basic_company' => 'home#basic_company'

# 리뷰게시판
  get '/review/list'
  post '/review/create' => 'review#create'
  
  get '/review/show/:review_id' => 'review#show'
  get '/review/edit/:review_id' => 'review#edit'
  post '/review/update/:review_id' => 'review#update'
  post '/reveiw/destroy/:review_id' => 'review#destroy'
  
  
  get 'review/review_form' => 'review#review_form'

#모든 미용실 정보를 카드 게시판 형태로 보여주는 페이지

  get 'home/hairshop'  => 'home#hairshop' 

#특정 미용실만 보는 페이지
  get '/home/hairshop/:id' => 'home#hairshop_each'

  get 'home/mypage_user' => 'home#mypage_user'

  get 'home/mypage_company' => 'home#mypage_company'

  
  get 'home/index'

  post 'home/login' => 'home#login'

  get '/logout' => 'home#logout'
  
 get 'home/sign_up_user'
 get 'home/sign_up_company'
  
  
  
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
