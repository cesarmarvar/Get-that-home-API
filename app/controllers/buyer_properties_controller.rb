class BuyerPropertiesController < ApplicationController
  before_action :authorize

  def index
    if current_user.user_type.zero?
      render json: current_user.properties
    else
      properties = current_user.buyer_properties.map(&:property)
      render json: properties
    end
  end
end
