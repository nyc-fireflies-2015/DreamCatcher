class AddRankToDreamers < ActiveRecord::Migration
  def change
    add_column :dreamers, :rank, :string, default: "Newbie"
  end
end
