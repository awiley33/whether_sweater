class Api::V0::UsersController < ApplicationController
  def create
    # user = User.create({email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: set_api_key})
    user = User.create!(user_params.merge(api_key: set_api_key))
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def set_api_key
    SecureRandom.base58(24)
  end
end