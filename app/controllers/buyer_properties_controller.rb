class BuyerPropertiesController < ApplicationController
  before_action :authorize
  before_action :set_properties, only: %i[update destroy]

  def index
    if current_user.user_type == "landlord"
      render json: current_user.properties
    else
      properties = current_user.buyer_properties.map { |e| { id: e.id, property_status: e.property_status, property: e.property } }
      render json: properties
    end
  end

  def create
    @buyer_property = current_user.buyer_properties.new(buyer_params)
    if @buyer_property.save
      render json: @buyer_property, status: :created
    else
      render json: { errors: @buyer_property.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @saved_property.update(buyer_params)
      render json: @saved_property
    else
      render json: { errors: @saved_property.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @saved_property.destroy
    head :ok
  end

  private

  def set_properties
    @saved_property = current_user.buyer_properties.find(params[:id])
  end

  def buyer_params
    params.permit(:property_id, :property_status)
  end
end
