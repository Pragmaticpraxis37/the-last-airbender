require 'ostruct'

class SearchController < ApplicationController

  def index
    formatted_query_term = params[:nation].gsub(/_/, '+')
    @display_information = SearchFacade.information(formatted_query_term)
    @total_number_of_people = SearchFacade.total_people(formatted_query_term)
  end


  # def index
  #   formatted_query_term = params[:nation].gsub(/_/, '+')
  #   response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?perPage=150&affiliation=#{formatted_query_term}")
  #   total_data = JSON.parse(response.body, symbolize_names: true)
  #
  #   @total_number_of_people = total_data.length
  #
  #   batch = total_data[0..24]
  #
  #   @display_information = batch.reduce([]) do |acc, data|
  #     acc << OpenStruct.new({
  #                             name: data[:name],
  #                             photo: data[:photoURL],
  #                             allies: data[:allies],
  #                             enemies: data[:enemies],
  #                             affiliations: data[:affiliation]
  #       })
  #   end
  # end
end


# params[:nation]
# https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=Fire+Nation
