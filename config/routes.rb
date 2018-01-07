Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


 root "artists#index"

   resources :artists do
      resources :songs, only: [:create, :show, :destroy]
     resources :photos, only: [:destroy]
   end
   namespace :api do
     resources :artists, only: [:index] do
       resources :songs, only: [:create, :show, :destroy]
     end
 end
end
