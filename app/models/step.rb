class Step < ActiveRecord::Base
  has_many :recipes
  def self.default
    where(default: true)
  end
end
