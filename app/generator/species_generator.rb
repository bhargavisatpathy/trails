class SpeciesGenerator
  def self.save_species
    all_trails = Trail.all.limit(3)
    all_trails.each do |trail|
      ApiCombiner.get_species(trail.id)
    end
  end
end
