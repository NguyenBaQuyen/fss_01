class Supports::Personal
  def initialize current_user
    @recipes = current_user.recipes.all
    @collections = current_user.collections.all
  end

  def current_user_collections
    @collections
  end

  def current_user_recipes
    @recipes.published
  end

  def current_user_recipes_draft_count
    @recipes.draft.size
  end

  def current_user_recipes_public_count
    @recipes.not_draft.size
  end

  def current_user_collection_count
    @collections.size
  end

  def current_user_recipe_count
    @recipes.size
  end
end
