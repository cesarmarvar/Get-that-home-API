class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      user.regenerate_token
      respond_user = {
        user_type: user.user_type,
        name: user.name,
        email: user.email,
        phone: user.phone,
        token: user.token
      }
      render json: { respond_user }, status: :ok
    else
      respond_unauthorized("Incorrect email or password")
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end
