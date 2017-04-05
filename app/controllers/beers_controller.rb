class BeersController < ApplicationController
  def index
    @beers = Unirest.get("http://localhost:3000/api/v2/beers").body
    render "index.html.erb"
  end

  def show
    @beer = Unirest.get("http://localhost:3000/api/v2/beers/#{params[:id]}").body
    render "show.html.erb"
  end
end
