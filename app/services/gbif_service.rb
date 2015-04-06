class GbifService
  attr_reader :connection, :genus

  def initialize
    @connection = Faraday.new(url:"http://api.gbif.org/v1/occurrence/")
  end

  def species
    parse(connection
      .get("search?decimalLatitude=35,35.2&decimalLongitude=-96,-95.8"))
  end

  private

  def parse(response)
    all_species = JSON.parse(response.body)["results"].map do |item|
      item["species"]
    end
  end
end
