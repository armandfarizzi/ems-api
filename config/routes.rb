Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :reviews, only: [:index, :show, :create] do 
        collection do 
          post ':id/approve', to: 'reviews#approve'
        end
      end
    end
  end
end
