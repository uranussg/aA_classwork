class Post < ApplicationRecord
  validates :title, presence: true  
  validates :subs, presence: { message: "has to select at least one sub!" }

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs,
    dependent: :destroy
    # inverse_of: :post

  has_many :subs,
   through: :post_subs,
   source: :sub

  has_many :comments,
    dependent: :destroy
  
  # def has_a_sub
  #    if subs.nil?
  #     self[:errors] << "has to select at least one sub!"
  #    end
  #    !subs.nil?

  # end
end
