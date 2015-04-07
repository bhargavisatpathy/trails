class SpeciesGenerator
  def self.save_species
    all_trails = Trails.all.limit(3)
    all_trails.each do |trail|
      trail_species = find_species(trail)
      trail_species.each do |species|
      
      end
    end
  end

  def find_species(trail)
    ApiCombiner.get_species(trail[lat].to_f, trail[lng].to_f, trail.id)
  end
end
