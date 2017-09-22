Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'session/choose', to: 'users/sessions#choose'
    root to: "devise/sessions#new"
  end

  use_doorkeeper

  namespace :api do
    namespace :v1 do
      # another api routes
      get '/me' => 'credentials#me', defaults: { format: :json }
    end
  end
end
