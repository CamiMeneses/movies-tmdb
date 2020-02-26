Rails.application.routes.draw do
  get '/movies', to: 'movies#movies'
end
