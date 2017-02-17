class AddExpenseDateToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :expense_date, :string
  end
end
