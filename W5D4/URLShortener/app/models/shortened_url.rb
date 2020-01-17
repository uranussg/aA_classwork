# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true

  def self.random_code
    while true
      short_url = SecureRandom::urlsafe_base64
      if !self.exists?(:short_url => short_url)
        return short_url
        break
      end
    end
  end

  def self.create!(user, long_url)
    ShortenedUrl.new({ short_url: self.random_code, long_url: long_url, user_id: user.id })
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,     
    foreign_key: :shortened_url_id

  has_many :visitors,
    through: visits,
    source: url

  def num_clicks
    self.visits.length
  end

  def num_uniques
    data = URLShortener.instance.execute(<<-SQL, visits)
      SELECT 
        COUNT(DISTINCT user_id) as uniq
      FROM 
        ?   
    SQL
    data.first["uniq"]
  end
end
