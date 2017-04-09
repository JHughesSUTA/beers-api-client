class BeersController < ApplicationController
  def index
    @beers = Unirest.get("http://localhost:3001/api/v2/beers").body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @beer = Unirest.post("http://localhost:3001/api/v2/beers", 
      parameters: {
        name: params["form_name"],
        style: params["form_style"],
        alcohol: params["form_alcohol"]
      }
    ).body
    redirect_to "/beers/#{@beer['id']}"
  end

  def show
    @beer = Unirest.get("http://localhost:3001/api/v2/beers/#{params[:id]}").body
    render "show.html.erb"
  end

  def edit
    @beer = Unirest.get("http://localhost:3001/api/v2/beers/#{params[:id]}").body
    render "edit.html.erb"
  end

  def update
    @beer = Unirest.patch("http://localhost:3001/api/v2/beers/#{params[:id]}", 
      parameters: {
        name: params["form_name"],
        style: params["form_style"],
        alcohol: params["form_alcohol"]
      }
    ).body
    redirect_to "/beers/#{@beer['id']}"
  end

  def destroy
    @beer = Unirest.delete("http://localhost:3001/api/v2/beers/#{params[:id]}")
    redirect_to "/beers"
  end
end
