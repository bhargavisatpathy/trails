class TrailSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :city,
             :state,
             :country,
             :lat,
             :lng,
             :description,
             :directions,
             :activities
  has_many :activities
  has_many :species
end
