require 'ostruct'

class SearchController < ApplicationController

  def index
    formatted_query_term = params[:nation].gsub(/_/, '+')
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?perPage=150&affiliation=#{formatted_query_term}")
    total_data = JSON.parse(response.body, symbolize_names: true)

    total_number_of_people = total_data.length

    total_data.reduce([]) do |acc, data|
      # acc << OpenStruct.new({
      #                         name: data[:name],
      #                         allies: data[:allies],
      #                         enemies: data[:enemies],
      #                         affiliations: data[:affiliation]
      #   })
      require "pry"; binding.pry
    end
  end

end


# params[:nation]
# https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=Fire+Nation
