class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index

    @expenses = Expense.all
    get_current_daily_expenses


  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    @expense.update({
      expense_type: @expense.expense_type,
      expense_content: @expense.expense_content,
      expense_cost: @expense.expense_cost,
      expense_date: Date.today,
      purchaser_name: @expense.purchaser_name
    })

    # @expense.update({ expense_type: @expense.expense_type,
    #                   expense_content: @expense.expense_content,
    #                   expense_cost: @expense.expense_cost,
    #                   expense_date: Date.today,
    #                   purchaser_name: @expense.purchaser_name,
    #                   start_time: @expense.start_time})



    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def get_current_daily_expenses
    @current_daily_expenses = Expense.all.where({:expense_date => Date.today})
    @daily_total = 0
    @current_daily_expenses.each do |expense|
      @daily_total += expense.expense_cost
    end
  end

  def get_weekly_expenses
    #@weekly_expenses = Expense.all.where
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:start_time, :expense_type, :expense_date, :expense_content, :expense_cost, :purchaser_name)
  end
end
