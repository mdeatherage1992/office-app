Rails.application.routes.draw do
  devise_for :users
  resources :organizations
  resources :shifts
  post "organizations/join", :to => "organizations#join", :as => "join_organization"
  get "organizations/:id/view_shifts", :to => "organizations#view_shifts", :as => "view_shifts"
  patch "users/leave_organization", :to => "organizations#leave_organization", :as => "leave_organization"
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
