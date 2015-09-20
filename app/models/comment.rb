class Comment < ActiveRecord::Base
  belongs_to :dreamer
  belongs_to :dream

  validates_presence_of :content
end