class Hashtag < ActiveRecord::Base
  has_many :taggings
  has_many :dreams, through: :taggings
  scope :popular, -> {order('dreams_count DESC').limit(10)}

  def self.parse(hashtag_string)
    hashtag_string.split(", ").each_with_object([]) do |name, hashtags|
      hashtags << find_or_create_by(name: name)
    end
  end
end