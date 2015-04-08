module ApiCombiner
  def self.get_species(trail_id)
    gbif = GbifService.new
    eol = EolService.new
    trail = Trail.find(trail_id)
    trail_species = []

    gbif_species = gbif.species(trail.lat, trail.lng)
    gbif_species.each do |species|
      if species["species"]
        genus, spec = species["species"].split(" ")
        img = eol.image_from_species(genus, spec)

        trail_species << Species.create(
          trail_id: trail_id,
          kingdom: species["kingdom"],
          scientific_name: species["species"],
          common_name: species["vernacularName"],
          photo_url: img,
          clip_url: "not available",
          lat: species["decimalLatitude"],
          lng: species["decimalLongitude"])
      end
    end
    trail_species
  end
end
