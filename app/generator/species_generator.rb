class SpeciesGenerator
  def self.save_species
    all_trails = Trails.all
    all_trails.each do |trail|
      #find species close to trail
      #save species to database with trail_id
      trails_species.each do |species|
      Species.create(
        trail_id: trail.id,
        kingdom: species.kingdom,
        species: species.species,
        common_name: species.name
        photo_url: species.photo_url,
        clip_url: species.sound_clip_url,
        lat: species.lat,
        lng: species.lng)
      end
    end
  end
end
