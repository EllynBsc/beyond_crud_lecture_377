Rails.application.routes.draw do
  resources :restaurants  do # creating my 7 crud routes of restaurant
    resources :reviews, only: [:new, :create]# 2 routes for reviews

  # My Customized routes
      collection do
        get 'top' # get '/restaurants/top', to: 'restaurants#top'
      end

      member do
        get 'chef' # get '/restaurants/:id/chef', to 'restaurants#chef'
      end
  end

  #What we want => shallow nesting, because the review already exists and i don't need it anymore
  resources :reviews, only: [:show, :edit, :update, :delete, :index]
end
