Todolist::Application.routes.draw do
  root :to => "home#index"
  resources :invitations
  resources :lists, :only => [:new, :show] do
    put '/' => "lists#update"
    post "geckoboard"
    get "geckoboard"
  end
  
  match "/:id" => "lists#show"
  
end
