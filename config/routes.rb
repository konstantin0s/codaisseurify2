Rails.application.routes.draw do

  root "artists#index"

     resources :artists do
        resources :songs, only: [:create, :show, :destroy]
       resources :photos, only: [:destroy]
     end

end
