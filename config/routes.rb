Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/insert_entry', to: 'crop#create'
  get '/get_latest', to: 'crop#get_latest'
  get '/get_limited_result', to: 'crop#get_limited_result'
end
