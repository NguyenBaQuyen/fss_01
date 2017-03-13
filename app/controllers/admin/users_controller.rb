class Admin::UsersController < AdminController
  before_action :authenticate_user!
  before_action :load_roles, only: :index
  before_action :find_user, only: :update

  def index
    @users = User.paginate page: params[:page]
    authorize [:admin, @users]
  end

  def update
    @user.update_attributes role: params[:key]
    authorize @users
    respond_to do |format|
      format.js{
        flash[:success] = "Update Success!"
      }
    end
  end

  private
  def load_roles
    @roles = User.roles.collect{|role_name ,
      role_key| [role_name, role_name]}
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "errors.user_not_found"
    end
  end
end
