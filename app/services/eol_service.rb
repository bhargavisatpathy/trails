class EolService
  attr_reader :connection, :connection2

  def initialize
    @connection = Faraday.new(url: "http://eol.org/api/search/")
    @connection2 = Faraday.new(url: "http://eol.org/api/pages/1.0/")
  end

  def page_id(genus, species)
    parse(connection.get("1.0.json?q=#{genus}+#{species}&exact=false"))
  end

  def image(page_id)
    parse_page(connection2.get("#{page_id}.json?details=true"))
  end

  def image_from_species(genus, species)
    page = page_id(genus, species)
    image(page)
  end

  private

  def parse(response)
    JSON.parse(response.body)["results"][0]["id"]
  end

  def parse_page(response)
    all_entries = JSON.parse(response.body)["dataObjects"]
    i = 0
    image_url = nil
    until image_url.present? || i == all_entries.length
      image_url = all_entries[i]["eolMediaURL"]
      i += 1
    end
    image_url
  end
end
