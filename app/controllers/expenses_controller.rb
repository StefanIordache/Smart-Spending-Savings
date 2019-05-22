class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      @expenses = Expense.where(user_id: current_user.id)
    end
  end

  def show
    @expense = Expense.find(params[:id])
    @expense.tags.build

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @button_text = "Update"
    @expense = Expense.find(params[:id])
    @tags = {}
    Tag.all.collect {|t| @tags[t.title] = t.id }

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @expense = Expense.find(params[:id])

    handle_tags_for_expense
    
    if @expense.update_attributes(expense_params)

      flash[:success] = "Expense updated!"
      redirect_to action: 'index'

    else

      flash[:error] = "Expense update failed!"
      render 'edit'

    end
  end

  def new
    @button_text = "Create"
    @expense = Expense.new
    @tags = {}
    Tag.all.collect {|t| @tags[t.title] = t.id }
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user
      @expense = Expense.new(expense_params)
      @expense.user_id = current_user.id
      handle_tags_for_expense
      if @expense.save

        flash[:success] = "Expense created!"
        redirect_to action: 'index'

      else

        flash[:error] = "Expense create failed!"
        render 'new'

      end

    else
      flash[:error] = "Expense create failed!"
      render 'new'
    end

  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    flash[:success] = "Expense deleted!"

    redirect_to expenses_path
  end

  private

    def expense_params
      params.require(:expense).permit(:title, :description, :amount,
                                      :expense_date, :currency)
    end
    def handle_tags_for_expense
      if params['tag_ids']
        @expense.tags.clear
        tags = params['tag_ids'].map { |id| Tag.find(id) }
        @expense.tags << tags 
    end 

end
end
