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
    unless @reports.empty?
      flash[:danger] = t "admin.reports.no_data"
      redirect_to :back
    end
  end
end
