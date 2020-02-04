class Track < ApplicationRecord
    validates :title, :ord, presence: true
    validates :regular, inclusion: { in: [true, false], message: "Can only be true or false"}
    validates :title, uniqueness: {scope: :title}

    belongs_to :album  
    has_one :band,
        through: :album,
        source: :band

    def bonus  
        !regular
    end

    has_many :notes 

end
