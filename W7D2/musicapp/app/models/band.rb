class Band < ApplicationRecord
  validates :name, null:false

  has_many :albums
end
