class Hashtag < ActiveRecord::Base
  has_many :taggings
  has_many :dreams, through: :taggings
end