class BuyerPropertiesController < ApplicationController
  before_action :authorize

  def index 
    if current_user.user_type == 0
      render json: current_user.properties
    else
      render json: current_user.buyer_properties
    end
  end

  


end
