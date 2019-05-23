class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      @expenses = Expense.where(user_id: current_user.id)
      @reports = Report.where(user_id: current_user.id)
      @tags=Tag.where(user_id: current_user.id)
    end
  end

end
