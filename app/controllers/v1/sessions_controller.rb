class V1::SessionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first
    # byebug
    if @user&.valid_password?(params[:password])
      render :create, status: :created
      # user.as_json(only: [:email, :authentication_token]),
    else
      head(:unauthorized)
    end
  end

  def destroy
    current_user&.authentication_token = nil

    if current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end
