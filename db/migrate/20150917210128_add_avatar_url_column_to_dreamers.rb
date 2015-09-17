class AddAvatarUrlColumnToDreamers < ActiveRecord::Migration
  def change
    add_column :dreamers, :avatar_url, :string, limit: 2048
  end
end
