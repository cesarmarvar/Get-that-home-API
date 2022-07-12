class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      respond_user = {
        user_type: @user.user_type,
        name: @user.name,
        email: @user.email,
        phone: @user.phone,
        token: @user.token
      }

      render json: respond_user, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: current_user
  end

  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    head :ok
  end

  private

  def user_params
    params.permit(:user_type, :name, :email, :phone, :password)
  end
end
