class Favorite < ActiveRecord::Base
  belongs_to :fan, class_name: 'Dreamer'
  belongs_to :dream, counter_cache: true
end
