class Dream < ActiveRecord::Base
  belongs_to :dreamer
  has_many :favorites
  validates_presence_of :story
end