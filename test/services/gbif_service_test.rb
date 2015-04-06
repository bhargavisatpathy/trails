require "test_helper"

class GbifServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = GbifService.new
  end

  test "#species" do
    VCR.use_cassette("gbif_service_species_recordings") do
      species = service.species

      assert_equal "Petrochelidon pyrrhonota", species[0]
    end
  end
end
