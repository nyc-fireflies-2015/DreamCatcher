class ChangeLimitOnStateColumn < ActiveRecord::Migration
  def change
    change_column :dreamers, :state, :string, limit: 64
  end
end
