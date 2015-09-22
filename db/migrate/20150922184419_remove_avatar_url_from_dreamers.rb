class RemoveAvatarUrlFromDreamers < ActiveRecord::Migration
  def change
    remove_column :dreamers, :avatar_url, :string
  end
end
