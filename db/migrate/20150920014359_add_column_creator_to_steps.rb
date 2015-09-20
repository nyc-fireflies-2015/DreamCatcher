class AddColumnCreatorToSteps < ActiveRecord::Migration
  def change
    add_reference :steps, :creator
  end
end
