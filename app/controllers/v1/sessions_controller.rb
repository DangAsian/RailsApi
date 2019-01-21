class V1::SessionsController < ApplicationController

  def create
    model = Model.where(email: params[:email]).first

    if model&.valid_password?(params[:password])
      render json: model.as_json(only: [:id, :email]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
  end
end
