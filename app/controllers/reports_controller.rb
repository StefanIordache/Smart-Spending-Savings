class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      @reports = Report.where(user_id: current_user.id)
    end
  end

  def show
    @report = Report.includes(:expenses).find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @button_text = "Update"
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update_attributes(expense_params)

      flash[:success] = "Report updated!"
      redirect_to action: 'index'

    else

      flash[:error] = "Report update failed!"
      render 'edit'

    end
  end

  def new
    @button_text = "Create"
    @report = Report.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create

    @report = Report.new(expense_params)

    if current_user
      @report.user_id = current_user.id
    else
      render 'new'
    end

    if @report.save
      expenses = Expense.where(expense_date: @report.from_date..@report.to_date, user_id: current_user.id)

      if expenses.any?
        expenses.each do |expense|
          @report.expenses << expense
        end
      end

      flash[:success] = "Report created!"
      redirect_to action: 'index'

    else

      flash[:error] = "Report create failed!"
      render 'new'

    end

  end

  def destroy

    @report = Report.find(params[:id])
    @report.destroy

    flash[:success] = "Report deleted!"

    redirect_to reports_path

  end

  def remove_expense_from_report

    @report = Report.find(params[:report_id])

    if @report
      @expense = Expense.find(params[:expense_id])

      if @expense
        @report.expenses.delete(@expense)

        redirect_to action: "show", id: @report.id
      end
    end

  end

  private

  def expense_params
    params.require(:report).permit(:title, :from_date, :to_date, :description, :currency, :target_id)
  end
end
