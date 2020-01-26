require 'date'

class Cat < ApplicationRecord
  COLORS = ['Black', 'White', 'Brown', 'Orange', 'Blue']
  validates :birth_date, :name, :color, :sex, presence: true
  validates :sex, inclusion: { in: ['M', 'F'] }
  validates :color, inclusion: { in: Cat::COLORS }
  include ActionView::Helpers::DateHelper
  def age
    # Date.today - birth_date
    time_ago_in_words(birth_date)
  end
  has_many :cat_rental_requests,
    dependent: :destroy
end
