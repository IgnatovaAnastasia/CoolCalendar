Rails.application.routes.draw do
  resources :user

  get '/', to: 'calendar#show'
end
