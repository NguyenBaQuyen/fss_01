class Admin::ActivitiesController < AdminController
  before_action :authenticate_user!
  before_action :load_action_types, only: :new
  before_action :find_recipe, only: :new

  def new
    @activity = Activity.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @activity = Activity.new activity_params
    if @activity.save
      flash[:success] = t "admin.activities.send_success"
    else
      flash[:danger] = t "admin.activities.send_unsuccess"
    end
    redirect_to admin_recipes_path
  end

  def update
  end

  private
  def activity_params
    params.require(:activity).permit :user_id, :action_type, :url, :comment
  end

  def load_action_types
    @action_type = Activity.actions.collect{|action_name, action_key|
      [action_name, action_name]}.to_h
  end

  def find_recipe
    @recipe = Recipe.find_by id: params[:id]
    unless @recipe
      flash[:danger] = t "admin.recipe.recipe_not_found"
      redirect_to admin_recipes_path
    end
  end
end
