class ReviewsController < ApplicationController
  before_action :set_yacht, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.yacht = @yacht
    if @review.save
      redirect_to yacht_path(@yacht)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @yacht = @review.yacht
    redirect_to yacht_path(@yacht)
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
