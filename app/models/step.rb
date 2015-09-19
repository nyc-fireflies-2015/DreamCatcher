class Step < ActiveRecord::Base
  belongs_to :recipe
  def self.default
    where(default: true).map(&:dup)
  end
end
