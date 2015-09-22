class Hashtag < ActiveRecord::Base
  has_many :dream_hashtags
  has_many :dreams, through: :dream_hashtags
end