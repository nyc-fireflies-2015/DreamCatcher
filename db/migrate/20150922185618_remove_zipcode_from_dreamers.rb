class RemoveZipcodeFromDreamers < ActiveRecord::Migration
  def change
    remove_column :dreamers, :zipcode, :string
  end
end
