class YachtsController < ApplicationController
  before_action :find_yacht, only: [:show, :edit, :update]
  def index
    @yachts = Yacht.all
  end

  def show; end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    if @yacht.save
      redirect_to @yacht
    else
      render :new
    end
  end

  def edit; end

  def update
    if @yacht.update(yacht_params)
      redirect_to @yacht
    else
      render :edit
    end
  end

  private

  def yacht_params
    params.require(:yacht)
          .permit(:name, :location, :capacity, :description, :price_per_night)
  end

  def find_yacht
    @yacht = Yacht.find(params[:id])
  end
end
