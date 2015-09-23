class Dreamer < ActiveRecord::Base
  acts_as_messageable
  has_secure_password

  has_many :dreams
  has_many :comments
  has_many :favorites, foreign_key: :fan_id
  has_many :recipes
  has_many :steps, through: :recipes
  has_many :created_steps, class_name: "Step"

  validates_email_format_of :email, message: "Please enter valid email"
  validates :password, length: {minimum: 6}
  validates_presence_of :email, :username
  validates_uniqueness_of :username
  validates :phone_num, :phony_plausible => true

  def top_dreams
    dreams.order('created_at DESC').limit(5)
  end

  def self.reality_testers
    where('reality_check = true')
  end

  def awareness_dreams
    dreams.where(dreamer: self, dream_state_clarity: true)
  end

  def decision_making_dreams
   dreams.where(dreamer: self, decision_clarity: true)
  end

  def vivid_dreams
   dreams.where(dreamer: self, consciousness_clarity: true)
  end

  def mailboxer_email(object)
    return self.email
  end
end
