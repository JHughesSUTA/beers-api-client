Rails.application.routes.draw do
  get "/beers/:id" => "beers#show"
end
