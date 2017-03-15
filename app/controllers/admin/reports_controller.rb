class Admin::ReportsController < AdminController

  before_action :authenticate_user!
  before_action :find_reports, only: :show

  def show
    respond_to do |format|
      format.js
    end
  end

  private
  def find_reports
    @reports = Report.where recipe_id: params[:id]
  end
end
