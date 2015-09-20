require 'going_postal'

class Dreamer < ActiveRecord::Base
  has_secure_password
  validates_email_format_of :email, message: "Please enter valid email"
  validates :avatar_url, format: {with: /\.(png|jpe?g|gif)\Z/i}, on: [:update]
  has_many :dreams
  has_many :favorites, foreign_key: :fan_id
  has_one :recipe, foreign_key: :creator_id
  validates :password, length: {minimum: 6}
  validates_presence_of :email, :username, :zipcode

  validate :us_zipcode?

  def us_zipcode?
    errors.add(:zipcode, "invalid. Please enter a valid US zipcode.") unless GoingPostal.postcode?(zipcode, "US")
  end

  def top_dreams
    dreams.limit(5).order('created_at DESC')
  end
end
