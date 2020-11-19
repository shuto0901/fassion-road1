Rails.application.routes.draw do
  
  root 'homes#top'
  get 'homes/about'
  get 'rooms/show'
  get 'rooms/index'
  
  devise_for :companys, controller: {
    sessions: "companys/sessions",
    passwords: "companys/passwords",
    registrations: "companys/registration"
 }
  
  resources :company, only:[:show, :edit, :update]
  
  get 'contacts/index'
  get 'contacts/confirm'
  get 'contacts/thanks'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  
  namespace :personal do
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only:[:show, :edit, :update]
  end

  get 'contacts' => 'contacts#index'
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/thanks' => 'contacts#thanks'


  resources :rooms, :only => [:index, :show, :create] do
    resources :messages, :only => [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
