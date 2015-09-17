class Dreamer < ActiveRecord::Base
  has_many :dreams
  has_many :favorites, foreign_key: :fan_id
  validates_length_of :password, minimum: 6, too_short: "please enter at least %d character"
  validates_presence_of :email, :username, :zipcode
end