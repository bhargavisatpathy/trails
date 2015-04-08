class Trail < ActiveRecord::Base
  has_many :activities
  has_many :species
end
