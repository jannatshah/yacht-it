class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_yacht, only: [:show, :edit, :update]
  def index
    @yachts = Yacht.all

    @yacht_locations = Yacht.geocoded # returns yachtlocations with coordinates
    if params[:query].present?
      @yachts = Yacht.search(params[:query])
    end
    @markers = @yacht_locations.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { yacht: yacht }),
        image_url: helpers.asset_url('yacht_icon.png')
      }
    end
  end

  def show
    @reviews = @yacht.reviews
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    if @yacht.save
      # @yacht.photos.purge
      # @yacht.photos.attach(params.dig(:yacht, photos: []))
      redirect_to @yacht
    else
      render :new
    end
  end

  def edit; end

  def update
    if @yacht.update(yacht_params)
      # @yacht.photos.purge
      # @yacht.photos.attach(params.dig(:yacht, photos: []))
      redirect_to @yacht
    else
      render :edit
    end
  end

  private

  def yacht_params
    params.require(:yacht).permit(:name, :location, :capacity, :description, :price_per_night, photos: [])
  end

  def find_yacht
    @yacht = Yacht.find(params[:id])
  end
end
