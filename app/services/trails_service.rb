class TrailsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://outdoor-data-api.herokuapp.com/api")
  end

  def get_all_trails
    parse(connection.get do |req|
      req.params["api_key"] = ENV["trails_api_key"]
      req.params["format"] = "json"
      req.params["Country"] = "United States"
      req.params["limit"] = 10
    end)
  end

  private

  def parse(response)
    JSON.parse(response.body)["places"]
  end
end
