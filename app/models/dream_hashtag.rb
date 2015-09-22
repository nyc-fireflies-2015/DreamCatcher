class DreamHashtag < ActiveRecord::Base
  belongs_to :hashtag
  belongs_to :dream
end
