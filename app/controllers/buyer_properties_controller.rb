class BuyerPropertiesController < ApplicationController
  before_action :authorize

  def index
    if current_user.user_type == "landlord"
      render json: current_user.properties
    else
      properties = current_user.buyer_properties
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

  private

  def buyer_params
    params.permit(:property_id, :property_status)
  end
end
