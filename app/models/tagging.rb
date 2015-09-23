class Tagging < ActiveRecord::Base
  belongs_to :hashtag, counter_cache: :dreams_count
  belongs_to :dream
end
