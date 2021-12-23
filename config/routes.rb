Rails.application.routes.draw do
  
  resources :posts do
    member do
      delete :delete_file
    end
  end
end
