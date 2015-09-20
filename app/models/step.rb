class Step < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  def self.default
    where(default: true)
  end
end
