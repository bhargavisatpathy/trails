class TrailsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://outdoor-data-api.herokuapp.com/api")
  end

  def trails
    parse(connection.get do |req|
      req.params['api_key'] = 'b9cfeeefd2bde349eedce7e901254da5' #ENV['trailapi_key']
      req.params['format'] = 'json'
      req.params['lat'] = 37.75
      req.params['lon'] = -122.42
      req.params['radius'] = 3
    end)
  end

  private

  def parse(response)
    JSON.parse(response.body)["places"]
  end

end
