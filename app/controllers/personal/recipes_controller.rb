class Personal::RecipesController < PersonalController
  before_action :sidebar_count, only: [:index, :destroy]
  before_action :list_recipes, only: [:index, :destroy]

  def index
  end

  def destroy
    @recipe = Recipe.find_by id: params[:id]
    @recipe.destroy
    respond_to do |format|
      format.html {redirect_to recipes_path, notice: t("recipe.destroy")}
      format.js {render layout: false}
    end
  end

  private
  def list_recipes
    if params[:type] == Settings.recipe_index_type.draft
      @title = t "recipe.draft"
      @recipes = current_user.recipes.draft
    else
      @title = t "recipe.user_recipe_registed"
      @recipes = current_user.recipes.not_draft
    end
    @type = params[:type]
  end
end
