class Api::V1::ThrowsController < ApplicationController
  before_action :authenticate_user

  def create
    @facade = CreateFacade.new(@current_user, secured_params)

    @facade.save

    render :create, status: :ok
  rescue ArgumentError, ActiveRecord::RecordInvalid => e
    render json: { error: e }, status: :unprocessable_entity
  end

  private

  def secured_params
    params.permit(:game_key, :api_key, :score)
  end
end
