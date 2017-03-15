class Admin::DashboardController < AdminController
  before_action :authenticate_user!

  def home
    authorize [:admin, current_user]
  end
end
