class Post < ApplicationRecord
  validates :title, presence: true  
  # before_validates :has_a_sub

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs

  has_many :subs,
   through: :post_subs,
   source: :sub

  has_many :comments
  
  def has_a_sub
    !subs.nil
  end
end
