Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/new', to: 'games#new'
  get '/score', to: 'games#score'
 
end
