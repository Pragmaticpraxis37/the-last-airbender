class SearchController < ApplicationController

  def index
    formatted_query_term = params[:nation].gsub(/_/, '+')
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=#{formatted_query_term}")
    total_data = JSON.parse(response.body, symbolize_names: true)

    total_data.each do |data|
      require "pry"; binding.pry
    end
  end

end


# params[:nation]
# https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=Fire+Nation
