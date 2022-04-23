Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => {:sessions => "users/sessions", :registrations => "users/registrations", :passwords => "users/passwords" }, :path_names => { :sign_up => 'new', :sign_in => 'login', :sign_out => 'logout' }
  as :user do
  end

  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end

  get 'users', :to => 'users#show', as: 'users'


  #intro
  get 'intro', :to=>'intro#index', as: 'intro'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # 관리자
  scope 'admin', module: 'admin', as: 'admin' do
    get '/' => 'admin_home#index'

    resources :address_categories
    resources :addresses
    resources :accounts
    resources :users
    resources :orders
    resources :reservations
    resources :operators
    resources :branches
    resources :receipts
  end
end
