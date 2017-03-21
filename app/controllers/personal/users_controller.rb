class Personal::UsersController < PersonalController
  before_action :sidebar_count, only: [:show, :edit]

  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes user_params
      flash[:success] = t "update_success"
      redirect_to personal_root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :description, :avatar, :avatar_cache,
      :country
  end
end
