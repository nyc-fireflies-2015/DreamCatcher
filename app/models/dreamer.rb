class Dreamer < ActiveRecord::Base
  has_secure_password
  validates_email_format_of :email, message: "Please enter valid email"
  has_many :dreams
  has_many :favorites, foreign_key: :fan_id
  has_one :recipe, foreign_key: :creator_id
  validates :password, length: {minimum: 6}
  validates_format_of :zipcode,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "is not valid. Please try again."
  validates_presence_of :email, :username, :zipcode
  def top_dreams
    dreams.limit(5).order('created_at DESC')
  end
end
