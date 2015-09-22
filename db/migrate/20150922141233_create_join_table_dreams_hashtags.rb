class CreateJoinTableDreamsHashtags < ActiveRecord::Migration
  def change
    create_table :dreams_hashtags do |t|
      t.references :hashtag
      t.references :dream
    end
  end
end
