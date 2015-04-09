class Trail < ActiveRecord::Base
  has_many :activities
  has_many :species

  scope :filter_by_state, -> (state) {
    where("lower(state) LIKE ?", "%#{state.downcase}%")
  }

  scope :filter_by_lat, -> (lat) {
    where("lat BETWEEN ? AND ?", lat - 1, lat + 1)
  }
end
