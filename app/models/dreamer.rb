class Dreamer < ActiveRecord::Base
  has_secure_password
  validates_email_format_of :email, message: "Please enter valid email"
  has_many :dreams
  has_many :favorites, foreign_key: :fan_id
  validates_length_of :password, minimum: 6, too_short: "please enter at least %d character"
  validates_presence_of :email, :username, :zipcode
end