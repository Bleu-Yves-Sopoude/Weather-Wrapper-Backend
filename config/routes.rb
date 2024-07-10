Rails.application.routes.draw do
  get '/weather/:city', to: 'weather#show'
end
