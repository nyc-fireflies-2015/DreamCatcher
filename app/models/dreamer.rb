class Dreamer < ActiveRecord::Base
  has_secure_password
  validates_email_format_of :email, message: "Please enter valid email"
  has_many :dreams
  has_many :favorites, foreign_key: :fan_id
  has_one :recipe, foreign_key: :creator_id
  validates :password, length: {minimum: 6}
  validates_format_of :zip_code,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "should be 12345 or 12345-1234"
  validates_presence_of :email, :username, :zipcode
end
