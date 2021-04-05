class SearchController < ApplicationController

  def index
    require "pry"; binding.pry

    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=#{params[:nation]}")
    json = JSON.parse(response.body, symbolize_names: true)


  end

end


# params[:nation]
# https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=Fire+Nation
