json.extract! expense, :id, :expense_type, :expense_content, :expense_cost, :purchaser_name, :created_at, :updated_at
json.url expense_url(expense, format: :json)