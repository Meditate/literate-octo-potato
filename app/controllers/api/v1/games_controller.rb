class Api::V1::GamesController < ApplicationController
  def create
    @game = Game.create(key: SecureRandom.uuid)

    render :create, status: :ok
  end
end
