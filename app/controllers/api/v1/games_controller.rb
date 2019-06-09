class Api::V1::GamesController < ApplicationController
  before_action :authenticate_user

  def create
    @game = Game.create(key: SecureRandom.uuid)

    render :create, status: :ok
  end
end
