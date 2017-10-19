Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do
      resources :posts, only: [:create] do
        collection do
          get :top_rated
          get :ip_list
        end

        resources :ratings, only: [:create]
      end
    end
  end

end
