class Api::V0::SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in(user)
      end
    render json: UserSerializer.new(user)
  end



end