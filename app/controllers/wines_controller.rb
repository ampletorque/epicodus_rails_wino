class WinesController <ApplicationController
  def index
    # binding.pry
    if (params[:sort_order])
      @sort_order = (params[:sort_order])
    else
      @sort_order = "name"
    end

    @wines = Wine.all.sort_by {|wine| wine.public_send(@sort_order) }
    @random_wine = Wine.order("RANDOM()").first

  end

  def search
    # @results = Wine.basic_search(params)
    binding.pry
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      redirect_to wines_path
    else
      render :new
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      redirect_to wines_path
    else
      render :edit
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

  private
  def wine_params
    params.require(:wine).permit(:name, :year, :grapes, :label, :winery)
  end
end
