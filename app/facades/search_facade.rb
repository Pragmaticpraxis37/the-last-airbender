require 'ostruct'

class SearchFacade

  def self.end_point(nation)
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?perPage=150&affiliation=#{nation}")
    total_data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.total_people
    total_number_of_people = total_data.length
  end

  def self.information

    batch = total_data[0..24]

    @display_information = batch.reduce([]) do |acc, data|
      acc << OpenStruct.new({
                              name: data[:name],
                              photo: data[:photoURL],
                              allies: data[:allies],
                              enemies: data[:enemies],
                              affiliations: data[:affiliation]
        })
    end
  end
end
