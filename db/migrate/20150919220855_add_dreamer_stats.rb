class AddDreamerStats < ActiveRecord::Migration
  def change
    add_column :dreamers, :country, :string, limit: 2
    add_column :dreamers, :state, :string, limit: 2
    add_column :dreamers, :gender, :string, limit: 16
  end
end
