class Admin::RecipesController < AdminController
  before_action :authenticate_user!
  before_action :load_statuses, only: :index
  before_action :find_recipe, only: [:update, :destroy]

  def index
    if params.has_key? :filter
      @recipes = Recipe.send(params[:filter]).paginate page: params[:page]
      authorize [:admin, current_user]
      @status_filter = params[:filter]
    else
      @recipes = Recipe.paginate page: params[:page]
      authorize [:admin, current_user]
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @recipe.update_attributes status: params[:status]
    respond_to do |format|
      format.js{
        flash[:success] = t "admin.users.change_success"
      }
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def find_recipe
    @recipe = Recipe.find_by id: params[:id]
    unless @recipe
      flash[:danger] = t "errors.recipe_not_found"
      redirect_to root_path
    end
  end

  def load_statuses
    @statuses = Recipe.statuses.collect{|status_name, status_id|
      [status_name, status_name]}
  end
end
