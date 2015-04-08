class Trail < ActiveRecord::Base
  has_many :activities

  scope :filter_by_state, -> (state) {
    where("lower(state) LIKE ?", "%#{state.downcase}%")
  }

  scope :filter_by_lat, -> (lat) {
    where("lat BETWEEN ? AND ?", lat - 1, lat + 1)
  }

  # scope :filter_by_long, -> (long) {
  #   where("lng BETWEEN ? AND ?", long + 1, long - 1)
  # }
end
