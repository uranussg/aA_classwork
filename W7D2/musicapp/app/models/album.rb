class Album < ApplicationRecord
  validates :title, :year, presence:true

  belongs_to :band  
  def studio
    !self.live
  end

  has_many :tracks
end
