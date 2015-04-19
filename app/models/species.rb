class Species < ActiveRecord::Base
  belongs_to :trail

  scope :has_clip, -> {
    where.not(clip_url: ["not found", "not available"])
  }

end
