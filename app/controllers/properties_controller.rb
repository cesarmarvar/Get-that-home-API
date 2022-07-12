class PropertiesController < ApplicationController
  skip_before_action :authorize, only: %i[index show]
  before_action :set_property, only: %i[show update destroy]

  def index
    @properties = Property.all
    render json: @properties
  end

  def show
    render json: @property
  end

  def create
    @property = Property.new(property_params, user: current_user)
    if @property.save
      render json: @property, status: :created
    else
      render json: { errors: @property.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      render json: @property, status: :ok
    else
      render json: { errors: @property.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    head :ok
  end

  def random
    random_properties = Property.all.sample(3)
    render json: random_properties, status: :ok
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.permit(:address, :price, :maintenance, :property_type, :pets, :about, :bedrooms, :bathrooms, :area, :photos, :operation_type, :is_active)
  end
end
