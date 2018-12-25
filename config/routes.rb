Rails.application.routes.draw do
  get '/index', to: 'calendar#show'
  get '/', to: 'calendar#show'
end
