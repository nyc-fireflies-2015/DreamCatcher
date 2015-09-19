class Favorite < ActiveRecord::Base
  belongs_to :fan, class_name: 'Dreamer'
  belongs_to :dream
end
