class Dreamer < ActiveRecord::Base
  has_secure_password
  validates_email_format_of :email, message: "Please enter valid email"
  has_many :dreams
  has_many :favorites, foreign_key: :fan_id
  has_one :recipe
  validates :password, length: {minimum: 6}
  validates_presence_of :email, :username, :zipcode
end
