class AddColumnForEmail < ActiveRecord::Migration
  def change
    add_column :dreamers, :email, :string
  end
end
