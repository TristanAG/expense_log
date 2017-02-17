class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.text :expense_content
      t.float :expense_cost
      t.string :purchaser_name

      t.timestamps
    end
  end
end
