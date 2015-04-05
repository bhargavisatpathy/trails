class TrailGenerator

  def self.save_trails(data)
    data.each do |trail|
      t = Trail.new
      t.name        = trail["name"]
      t.city        = trail["city"]
      t.state       = trail["state"]
      t.country     = trail["country"]
      t.lat         = trail["lat"]
      t.lng         = trail["lon"]
      t.description = trail["description"]
      t.directions  = trail["directions"]
      t.save

      trail["activities"].each do |activity|
        a = Activity.new
        a.trail_id             = t.id
        a.activity_type_name   = activity["activity_type_name"]
        a.url                  = activity["url"]
        a.activity_description = activity["activity_description"]
        a.length               = activity["length"]

        a.save
      end
    end
  end
end
