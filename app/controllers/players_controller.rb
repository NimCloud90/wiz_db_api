class PlayersController < ApplicationController
  def create
    player = Player.new(player_params)
    if player.save
      render json: PlayerBluePrint.render(player, view: :normal), status: :created
    else render json: player.errors, status: :unprocessable_entity
    end
  end

  private
  def player_params
    params.permit(:username, :password, :password_confirmation)
  end
end
