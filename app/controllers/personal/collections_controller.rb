class Personal::CollectionsController < PersonalController
  before_action :find_collection, except: [:index, :new, :create]
  before_action :authorize_collection, only: [:update, :destroy]
  before_action :sidebar_count, only: [:index, :show]

  def index
  end

  def show
    @feeds = @collection.feeds
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build collection_params
    @collection.save
  end

  def edit
  end

  def update
    @collection.update_attributes collection_params
  end

  def destroy
    if @collection.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to personal_collections_path
  end

  private
  def find_collection
    @collection = Collection.find_by id: params[:id]
    unless @collection
      flash[:danger] = t "errors.collection_not_found"
      redirect_to personal_root_url
    end
  end

  def authorize_collection
    authorize @collection
  end

  def collection_params
    params.require(:collection).permit :name, :description, :cover, :cover_cache
  end
end
