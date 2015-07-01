class ReviewsController < ApplicationController
  def new
    @wine = Wine.find(params[:wine_id])
    @review = @wine.reviews.new
  end
  def create
    @wine = Wine.find(params[:wine_id])
    @review = @wine.reviews.new(review_params)
    if @review.save
      redirect_to wine_path(@review.wine)
    else
      render :new
    end
  end
  def edit
    @wine = Wine.find(params[:wine_id])
    @review = Review.find(params[:id])
    render :edit
  end
  def update
    @wine = Wine.find(params[:wine_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end
  def destroy
    @wine = Wine.find(params[:wine_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to wine_path(@wine)
  end
private
  def review_params
    params.require(:review).permit(:description, :rating, :user)
  end
end
