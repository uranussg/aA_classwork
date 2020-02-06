class PostSub < ApplicationRecord

  validates :post_id, uniqueness: { scope: :sub_id }

  belongs_to :post
    # inverse_of: :post_subs
  belongs_to :sub
    # inverse_of: :post_subs
end
