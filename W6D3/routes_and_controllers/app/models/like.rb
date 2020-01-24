class Like < ApplicationRecord
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :likeable,
    polymorphic: true
    
end
