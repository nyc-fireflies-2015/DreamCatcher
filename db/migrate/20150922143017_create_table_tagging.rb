class CreateTableTagging < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :hashtag
      t.references :dream
    end
  end
end
