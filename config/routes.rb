Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config.merge({
    controllers: {sessions: 'users/sessions'}, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }
   } )
  resources :upcoming_events do
    collection do
      get  'past_events'
      get 'upcomings'
      get 'live_events'
    end
  end
  # resources :pages
  resources :news
  get 'pages/filter/:scope' => 'pages#index', as: :filtered_page
  # resources :imagegalleries
   root to: 'home#index'
  resources :posts, :pictures, :aboutpages, shallow: true do
    resources :pictures
    member do
      post 'like'
      delete 'unlike'
    end
    resources :comments do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :replies
    end
  end
end
