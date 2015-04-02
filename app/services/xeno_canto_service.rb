class XenoCantoService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url:
      "http://www.xeno-canto.org/api/2")
  end

  def recordings(min_lat, min_long, max_lat, max_long)
    parse(connection
      .get("recordings?query=box:#{min_lat},#{min_long},#{max_lat},#{max_long}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)["recordings"]
  end
end
