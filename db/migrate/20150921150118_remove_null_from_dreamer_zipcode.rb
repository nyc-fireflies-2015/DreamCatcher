class RemoveNullFromDreamerZipcode < ActiveRecord::Migration
  def change
    change_column :dreamers, :zipcode, :string, :null => true
  end
end
