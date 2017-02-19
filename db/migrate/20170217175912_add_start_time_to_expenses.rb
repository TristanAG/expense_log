class AddStartTimeToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :start_time, :datetime
  end
end
