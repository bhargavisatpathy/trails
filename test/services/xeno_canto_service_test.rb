require "test_helper"

class XenoCantoServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = XenoCantoService.new
  end

  test "#recordings" do
    VCR.use_cassette("xeno_canto_service_recordings") do
      recordings = service.recordings(15, -96, 15.2, -90)
      first_recording = recordings.first

      assert_equal "216519", first_recording["id"]
      assert_equal "Columbina", first_recording["gen"]
    end
  end
end
