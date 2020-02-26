Rails.application.routes.draw do
  get '/movies', to: 'movies#movies'
  get '/movies/order_by/:order', to: 'movies#movies_order_by'
  get '/movies/:title', to: 'movies#create'
end
