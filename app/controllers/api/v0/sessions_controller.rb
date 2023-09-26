class Api::V0::SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in(user)
        render json: UserSerializer.new(user)
      else
        render json: { error: 'Invalid email or password' }, status: 401
      end
  end



end