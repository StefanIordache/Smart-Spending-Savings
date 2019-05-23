class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses=Expense.all
    @reports=Report.all
    @tags=Tag.all
  end
end
