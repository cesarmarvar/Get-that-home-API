class PropertiesController < ApplicationController
  skip_before_action :authorize, only: %i[index show random]
  before_action :set_property, only: %i[show]
  before_action :set_property_by_owner_user, only: %i[update destroy]

  def index
    @properties = Property.all
    render json: @properties
  end

  def show
    if @property
      render json: @property
    else
      render json: [], status: :not_found
    end
  end

  def create
    @property = current_user.properties.new(property_params)
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
    data = Property.find(params[:id])
    @property = {
      id: data.id,
      address: data.address,
      price: data.price,
      maintenance: data.maintenance,
      property_type: data.property_type,
      pets: data.pets,
      about: data.about,
      bedrooms: data.bedrooms,
      bathrooms: data.bathrooms,
      area: data.area,
      operation_type: data.operation_type,
      is_active: data.is_active,
      lat: data.lat,
      long: data.long,
      user_info: {
        id: data.user.id,
        name: data.user.name,
        email: data.user.email,
        phone: data.user.phone
      },
      image_urls: data.image_urls
    }
  end

  def set_property_by_owner_user
    @property = current_user.properties.find(params[:id])
  end

  def property_params
    params.permit(:address, :price, :maintenance, :image_urls, :property_type, :pets, :about, :bedrooms, :bathrooms, :area, :lat, :long, :operation_type, :is_active)
  end
end
