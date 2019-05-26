class Api::V1::UsersController < ApplicationController
  def create
    key = SecureRandom.uuid

    @user = User.new(api_key: key)

    if @user.save
      render :create, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
