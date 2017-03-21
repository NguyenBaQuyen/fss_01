class RecipesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_action :find_recipe, except: [:index, :new, :create]
  before_action :authorize_recipe, except: [:index, :new, :create]

  after_action :verify_authorized, except: [:index, :new, :create]

  def index
  end

  def show
    @new_comment = @recipe.comments.build
    CalculateViewsCountService.new(@recipe).calculate
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build recipe_params
    if @recipe.save
      flash[:success] = t "recipe.success"
      redirect_to recipe_recipe_step_path(@recipe, Settings.step.confirm_material)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update_attributes recipe_params
      flash[:success] = t "recipe.update_success"
      redirect_to recipe_recipe_step_path(@recipe, Settings.step.confirm_material)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    flash[:danger] = t "recipe.destroy"
    redirect_to root_url
  end

  private
  def find_recipe
    @recipe = Recipe.find_by id: params[:id]
    unless @recipe
      flash[:danger] = t "errors.recipe_not_found"
      redirect_to root_url
    else
      authorize @recipe
    end
  end

  def authorize_recipe
    authorize @recipe
  end

  def recipe_params
    params.require(:recipe).permit :name, :cover, :duration,
      :description, :status
  end

  def list_recipes
    if params[:type] == Settings.recipe_index_type.draft
      @title = t "recipe.draft"
      @recipes = current_user.recipes.draft
    else
      @title = t "recipe.user_recipe_registed"
      @recipes = current_user.recipes.not_draft
    end
    @recipes_count = current_user.recipes.all
  end
end
