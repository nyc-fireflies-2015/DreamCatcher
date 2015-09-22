class CreateTableTagging < ActiveRecord::Migration
  def change
    create_table :table_taggings do |t|
      t.references :hashtag
      t.references :dream
    end
  end
end
