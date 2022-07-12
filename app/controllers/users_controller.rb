class UsersController < ApplicationController
  skip_before_action :authorize, only: :create
  before_action :set_user, only: %i[show]

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
    render json: @respond_user
  end

  def update
    if current_user.update(user_params)
      respond_user = {
        user_type: current_user.user_type,
        name: current_user.name,
        email: current_user.email,
        phone: current_user.phone
      }
      render json: respond_user, status: :ok
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    head :ok
  end

  private

  def set_user
    @respond_user = {
      user_type: current_user.user_type,
      name: current_user.name,
      email: current_user.email,
      phone: current_user.phone
    }
  end

  def user_params
    params.permit(:user_type, :name, :email, :phone, :password)
  end
end
