class Sub < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, uniqueness: true 
  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs,
    dependent: :destroy
    # inverse_of: :sub 

  has_many :posts,
    through: :post_subs,
    source: :post
end
