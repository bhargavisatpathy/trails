module ApiCombiner
  def populate_trails_database
  end

  def self.get_species(trail_id)
    VCR.use_cassette("api_combiner_recording") do
      gbif = GbifService.new
      eol = EolService.new
      trail = Trail.find(trail_id)

      gbif_species = gbif.species(trail.lat, trail.lng)

      gbif_species.each do |species|
        genus, spec = species["species"].gsub(" ", "+")

        img = eol.image_from_species(genus, spec)

        Species.create(
          trail_id: trail_id,
          kingdom: species["kingdom"],
          species: species["species"],
          common_name: "not available",
          photo_url: img,
          clip_url: "not available",
          lat: species["decimalLatitude"],
          lng: species["decimalLongitude"])
      end
    end
  end
end
