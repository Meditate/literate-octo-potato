class Api::V1::GamesController < ApplicationController
  before_action :authenticate_user

  def create
    @game = Game.create(key: SecureRandom.uuid)

    render :create, status: :ok
  end

  def current_state
    @game = Game.find_by!(key: params[:game_key])

    render :current_state, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :unprocessable_entity
  end
end
