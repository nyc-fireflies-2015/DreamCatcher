class Dream < ActiveRecord::Base
  attr_accessor :hashtag_string
  belongs_to :dreamer
  has_many :comments
  has_many :favorites
  has_many :taggings
  has_many :hashtags, through: :taggings
  accepts_nested_attributes_for :hashtags, :allow_destroy => true
  
  validates_presence_of :story, :title

  scope :popular, -> {order('favorites_count DESC').limit(10)}

  def favorite_by(dreamer)
    favorites.where(fan: dreamer)
  end

  def favorite?(dreamer)
    favorites.where(fan: dreamer).any?
  end

  def calculate_lucidity
    lucidity_rating = 0
    lucidity_rating += 1 if self.consciousness_clarity?
    lucidity_rating += 1 if self.dream_state_clarity?
    lucidity_rating += 1 if self.decision_clarity?
    return lucidity_rating
  end

end
