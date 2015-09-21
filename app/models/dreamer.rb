require 'going_postal'

class Dreamer < ActiveRecord::Base
  has_secure_password

  has_many :dreams
  has_many :comments
  has_many :favorites, foreign_key: :fan_id
  has_many :recipes
  has_many :steps, through: :recipes
  has_many :created_steps, class_name: "Step"

  validates_email_format_of :email, message: "Please enter valid email"
  validates :avatar_url, format: {with: /\.(png|jpe?g|gif)\Z/i}, on: [:update]
  validates :password, length: {minimum: 6}
  validates_presence_of :email, :username
  validates_uniqueness_of :username
  validate :us_zipcode?

  def us_zipcode?
    errors.add(:zipcode, "invalid. Please enter a valid US zipcode.") unless GoingPostal.postcode?(zipcode, "US")
  end

  def top_dreams
    Dream.order('created_at DESC').limit(5)
  end

  def awareness_dreams
    Dream.where(dreamer: self, dream_state_clarity?: true)
  end

  def decision_making_dreams
    Dream.where(dreamer: self, decision_clarity?: true)
  end

  def vivid_dreams
    Dream.where(dreamer: self, consciousness_clarity?: true)
  end
end
