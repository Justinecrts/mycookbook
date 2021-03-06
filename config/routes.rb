Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :edit] do
    resources :doses, only: [:create, :edit, :destroy]
  end
end
